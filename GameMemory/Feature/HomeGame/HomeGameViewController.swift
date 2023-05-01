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
    
    override func loadView() {
        view = homeGameView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        homeGameView.delegate = self
    }
}

// MARK: - HomeGameViewDelegate

extension HomeGameViewController: HomeGameViewDelegate {
    func clickButtonStartGame(value: String) {
        let viewModel = PlayGamesViewModel(count: value)
        let playGameViewController = PlayGameViewController(viewModel: viewModel)
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: playGameViewController)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        navigationController?.present(navBarOnModal, animated: false)
    }
}
