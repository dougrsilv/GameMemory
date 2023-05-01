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
    }
    
    // MARK: - Functions
    
    private func showAlertWithOptions() {
        let alert = UIAlertController(title: "Alerta", message: "Selecione uma Opção", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { alert in
            //
        }))
        
        alert.addAction(UIAlertAction(title: "Sair", style: .default, handler: { alert in
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
    }
}

// MARK: - PlayGameViewDelegate

extension PlayGameViewController: PlayGameViewDelegate {
    func clickSelectCorrectButton(Number: Int) {

        if viewModel.luckyNumber() == Number {
            print("Parabéns acertou!!!!")
            viewModel.addNumberSelect(add: Number)
        }
    }
    
    func clickButtonOption() {
        showAlertWithOptions()
    }
}

extension PlayGameViewController: PlayGamesViewModelOutput {
    func onPlayGame(list: [PlayGameModel]) {
        playGameView.buttonsGameView.setupData(game: list)
    }
}
