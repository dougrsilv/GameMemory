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
    private let viewModel: PlayGamesViewModel
    
    override func loadView() {
        view = playGameView
    }
    
    init(viewModel: PlayGamesViewModel) {
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
        callDelayList()
    }
    
    // MARK: - Functions
    
    private func showAlertWithOptions(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { alert in
            self.viewModel.resetAtAllListGameAndStartNumber()
            self.playGameView.LevelGame.text = self.viewModel.countSelectNumber()
            self.callDelayList()
        }))
        
        alert.addAction(UIAlertAction(title: "Sair", style: .default, handler: { alert in
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
    }
    
    private func callDelayList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.playGameView.buttonsGameView.viewBlink(list: self.viewModel.newSelectNumber)
        }
    }
}

// MARK: - PlayGameViewDelegate

extension PlayGameViewController: PlayGameViewDelegate {
    func clickSelectCorrectButton(number: Int) {
        viewModel.addListOptionUser(add: number)
        viewModel.equalReults()
    }
    
    func clickButtonOption() {
        showAlertWithOptions(title: "Alerta", text: "Selecione uma Opção")
    }
}

extension PlayGameViewController: PlayGamesViewModelOutput {
    func acertGamer() {
        callDelayList()
        playGameView.LevelGame.text = viewModel.countSelectNumber()
    }
    
    func errorGamer() {
        showAlertWithOptions(title: "Não Foi dessa vez", text: "Selecione uma Opção")
    }
    
    func onPlayGame(list: [PlayGameModel]) {
        playGameView.buttonsGameView.setupData(game: list)
    }
}
