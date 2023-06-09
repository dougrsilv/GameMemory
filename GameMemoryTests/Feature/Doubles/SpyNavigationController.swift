//
//  SpyNavigationController.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import UIKit

final class SpyNavigationController: UINavigationController {
    
    var pushViewController: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        pushViewController = viewControllerToPresent
        navigationController?.present(viewControllerToPresent, animated: true)
    }
    
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        pushViewController = viewController
//        super.pushViewController(viewController, animated: animated)
//    }
}
