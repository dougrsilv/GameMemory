//
//  SettingGameViewModelTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import XCTest
import UIKit
@testable import GameMemory

final class SettingGameViewModelTests: XCTestCase {

    func test_saveButtonAmout() {
        let sut = SettingGameViewModel(userDefaults: .standard)
        sut.saveButtonAmount(value: "5")
        
        let value = UserDefaults.standard.string(forKey:  "button") ?? ""
        
        XCTAssert(value == "5")
    }
    
    func test_resetResultMatch() {
        let sut = SettingGameViewModel(userDefaults: .standard)
        sut.resetResultMatch()
        
        let elements = UserDefaults.standard.string(forKey:  "elements")
        let level = UserDefaults.standard.string(forKey:  "level")
        let time = UserDefaults.standard.string(forKey:  "time")
        
        XCTAssert(elements == nil)
        XCTAssert(level == nil)
        XCTAssert(time == nil)
    }
}
