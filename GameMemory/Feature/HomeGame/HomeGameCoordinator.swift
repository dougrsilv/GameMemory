//
//  HomeGameCoordinator.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 17/06/23.
//

import UIKit

final class HomeGameCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeGameViewModel()
        let homeGameViewController = HomeGameViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.setViewControllers([homeGameViewController], animated: false)
    }
    
    func startSettingGame(delegate: SettingGameViewControllerDelegate) {
        let settingGameCoordinator = SettingGameCoordinator(navigationController: navigationController, delegate: delegate)
        settingGameCoordinator.start()
    }
    
    func startPlayGame(parameter: String) {
        let playGameCoordinator = PlayGameCoordinator(navigationController: navigationController, saveResult: parameter)
        playGameCoordinator.start()
    }
}
