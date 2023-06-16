//
//  PlayGameViewController.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    // MARK: - Properties
    
    private let playGameView = PlayGameView()
    private var viewModel: PlayGamesViewModelInput
    
    override func loadView() {
        view = playGameView
    }
    
    init(viewModel: PlayGamesViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        playGameView.delegate = self
        viewModel.delegate = self
        viewModel.fetchPlayGame()
        viewModel.startNumber()
        viewModel.timerCount()
        viewModel.recordMatchLevel()
        callDelayList()
        notificationdidEnterBackgroundNotification()
        notificationAppBackground()
    }
    
    // MARK: - Functions
    
    func notificationdidEnterBackgroundNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    func notificationAppBackground() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    func showAlertWithOptions(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { alert in
            self.playGameView.buttonsGameView.resetMatch = true
            self.viewModel.resetAtAllListGameAndStartNumber()
            self.playGameView.informationPlayGameView.LevelGame.text = self.viewModel.countSelectNumber()
            self.callDelayList()
            self.viewModel.disableRepeatButton = true
            self.viewModel.count = 0
        }))
        
        if viewModel.disableContinueButton == true {
            alert.addAction(UIAlertAction(title: "continuar", style: .default, handler: { alert in
                self.callDelayList()
                self.viewModel.timerCount()
            }))
        }
        
        if viewModel.disableRepeatButton == true {
            alert.addAction(UIAlertAction(title: "repetir", style: .default, handler: { alert in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.callDelayList()
                    self.viewModel.disableRepeatButton = false
                }
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Sair", style: .default, handler: { alert in
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
    }
    
    private func callDelayList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.playGameView.buttonsGameView.resetMatch = false
            self.playGameView.buttonsGameView.viewBlink(list: self.viewModel.newSelectNumber)
        }
    }
    
    @objc func applicationDidBecomeActive(notification: NSNotification) {
        showAlertWithOptions(title: "Jogo Pausado", text:  "Selecione uma Opção")
        viewModel.disableContinueButton = false
    }
    
    @objc func didEnterBackgroundNotification() {
        playGameView.buttonsGameView.resetMatch = true
        viewModel.disableContinueButton = true
        viewModel.timer.invalidate()
    }
}

// MARK: - PlayGameViewDelegate

extension PlayGameViewController: PlayGameViewDelegate {
    func clickSelectCorrectButton(number: Int) {
        viewModel.addListOptionUser(add: number)
        viewModel.equalReults()
    }
    
    func clickButtonOption() {
        showAlertWithOptions(title: "Aviso", text: "Selecione uma Opção")
    }
}

// MARK: - PlayGamesViewModelOutput

extension PlayGameViewController: PlayGamesViewModelOutput {
    func recorLevel(record: String) {
        playGameView.informationPlayGameView.recordGame.text = record
    }
    
    func timeValue(time: String) {
        playGameView.informationPlayGameView.timeGame.text = time
    }
    
    func acertGamer() {
        callDelayList()
        playGameView.informationPlayGameView.LevelGame.text = viewModel.countSelectNumber()
    }
    
    func errorGamer() {
        viewModel.disableRepeatButton = false
        showAlertWithOptions(title: "Não Foi dessa vez", text: "Selecione uma Opção")
    }
    
    func onPlayGame(list: [PlayGameModel]) {
        playGameView.buttonsGameView.setupData(game: list)
    }
}
