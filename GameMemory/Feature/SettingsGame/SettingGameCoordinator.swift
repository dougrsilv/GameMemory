//
//  SettingGameCoordinator.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 17/06/23.
//

import UIKit

final class SettingGameCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let delegate: SettingGameViewControllerDelegate
    
    init(navigationController: UINavigationController, delegate: SettingGameViewControllerDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    func start() {
        let viewModel = SettingGameViewModel()
        let settingGameViewController = SettingGameViewController(viewModel: viewModel)
        settingGameViewController.delegate = delegate
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: settingGameViewController)
        if let sheet = navBarOnModal.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.6 * context.maximumDetentValue
            }), .large()]
        }
        navigationController.present(navBarOnModal, animated: false)
    }
}
