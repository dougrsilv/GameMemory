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
        let standardTests = UserDefaults()
        let sut = SettingGameViewModel(userDefaults: standardTests)
        sut.saveButtonAmount(value: "5")
        
        let value = UserDefaults.standard.string(forKey:  "button") ?? ""
        
        XCTAssert(value == "5")
    }
    
    func test_resetResultMatch() {
        let standardTests = UserDefaults()
        let sut = SettingGameViewModel(userDefaults: standardTests)
        sut.resetResultMatch()
        
        let elements = UserDefaults.standard.string(forKey:  "elements")
        let level = UserDefaults.standard.string(forKey:  "level")
        let time = UserDefaults.standard.string(forKey:  "time")
        
        XCTAssert(elements == nil)
        XCTAssert(level == nil)
        XCTAssert(time == nil)
    }
}
