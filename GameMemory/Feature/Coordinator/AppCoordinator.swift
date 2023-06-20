//
//  AppCoordinator.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 17/06/23.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let homeGameCoordinator = HomeGameCoordinator(navigationController: navigationController)
        
        homeGameCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
