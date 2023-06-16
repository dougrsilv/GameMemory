//
//  SettingGameViewControllerDelegateSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import UIKit
@testable import GameMemory

class SettingGameViewControllerDelegateSpy: SettingGameViewControllerDelegate {
    
    private(set) var checkPassedResetMatch: Bool = false
    
    func resetMatch() {
        checkPassedResetMatch = true
    }
}
