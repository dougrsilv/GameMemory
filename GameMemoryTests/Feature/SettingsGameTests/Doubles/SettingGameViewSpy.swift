//
//  SettingGameViewSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import Foundation
@testable import GameMemory

final class SettingGameViewSpy: SettingGameViewDelegate {
    
    private(set) var ckeckClickSaveButton: Bool = false
    private(set) var checkClickResetButton: Bool = false
    private(set) var checkResultButton: String?
    
    func clickSaveButtonScreen(button: String) {
        ckeckClickSaveButton = true
        checkResultButton = button
    }
    
    func clickResetButton() {
        checkClickResetButton = true
    }
}
