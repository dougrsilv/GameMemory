//
//  HomeGameViewController.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

class HomeGameViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeGameView = HomeGameView()
    private let viewModel: HomeGameViewModel
    
    override func loadView() {
        view = homeGameView
    }
    
    init(viewModel: HomeGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        homeGameView.delegate = self
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.updateResult()
    }
    
    // MARK: - Function
    
    private func showAlert(title: String, text: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default))
        self.present(alert, animated: true)
    }
}

// MARK: - HomeGameViewDelegate

extension HomeGameViewController: HomeGameViewDelegate {
    func clickButtonStartGame(value: String) {
        if value == "0" {
            showAlert(title: "Aviso",
                                 text: "Número Inválido",
                                 buttonText: "Ok")
        } else {
            let viewModel = PlayGamesViewModel(count: value)
            let playGameViewController = PlayGameViewController(viewModel: viewModel)
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: playGameViewController)
            navBarOnModal.modalPresentationStyle = .fullScreen
            navigationController?.present(navBarOnModal, animated: false)
        }
    }
}

// MARK: - HomeGameViewModelOutput

extension HomeGameViewController: HomeGameViewModelOutput {

    func onNumberAcert(number: HomeGameModel?) {
        homeGameView.setupData(setup: number)
    }
}

