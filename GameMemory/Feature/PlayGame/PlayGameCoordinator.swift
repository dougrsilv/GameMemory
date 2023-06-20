//
//  PlayGameCoordinator.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 18/06/23.
//

import UIKit

final class PlayGameCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let saveResult: String
    
    init(navigationController: UINavigationController, saveResult: String) {
        self.navigationController = navigationController
        self.saveResult = saveResult
    }
    
    func start() {
        let viewModel = PlayGamesViewModel(count: saveResult)
        let playGameViewController = PlayGameViewController(viewModel: viewModel)
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: playGameViewController)
        navBarOnModal.modalPresentationStyle = .fullScreen
        navigationController.present(navBarOnModal, animated: false)
    }
}
