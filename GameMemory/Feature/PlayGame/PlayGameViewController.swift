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
        startGame()
    }
    
    // MARK: - Functions
    
    private func showAlertWithOptions(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { alert in
            self.viewModel.newSelectNumber.removeAll()
            self.viewModel.optionUser.removeAll()
            self.playGameView.LevelGame.text = String(self.viewModel.newSelectNumber.count)
            self.startGame()
        }))
        
        alert.addAction(UIAlertAction(title: "Sair", style: .default, handler: { alert in
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
    }
    
    private func startGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.startNumber()
            self.playGameView.buttonsGameView.viewBlink(list: self.viewModel.newSelectNumber)
        }
    }
}

// MARK: - PlayGameViewDelegate

extension PlayGameViewController: PlayGameViewDelegate {
    func clickSelectCorrectButton(number: Int) {
        
        viewModel.optionUser.append(number)
                
        switch viewModel.equalReults(count: viewModel.optionUser.count) {
        case true:
            viewModel.optionUser.removeAll()
            startGame()
            playGameView.LevelGame.text = String(viewModel.newSelectNumber.count)
            viewModel.processData(count: viewModel.newSelectNumber.count)
        case false:
            showAlertWithOptions(title: "Não Foi dessa vez", text: "Selecione uma Opção")
        default:
            break
        }
    }
    
    func clickButtonOption() {
        showAlertWithOptions(title: "Alerta", text: "Selecione uma Opção")
    }
}

extension PlayGameViewController: PlayGamesViewModelOutput {
    func onPlayGame(list: [PlayGameModel]) {
        playGameView.buttonsGameView.setupData(game: list)
    }
}
