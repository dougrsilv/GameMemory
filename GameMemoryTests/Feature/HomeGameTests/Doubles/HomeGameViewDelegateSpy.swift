//
//  HomeGameViewDelegateSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import UIKit
@testable import GameMemory

final class HomeGameViewDelegateSpy: HomeGameViewOutput {
    
    private(set) var checkPassedClickButtonStartGame: Bool = false
    private(set) var  checkPassedClickButtonConfiguration: Bool = false
    
    func clickButtonStartGame() {
        checkPassedClickButtonStartGame = true
    }
    
    func clickButtonConfiguration() {
        checkPassedClickButtonConfiguration = true
    }
}
