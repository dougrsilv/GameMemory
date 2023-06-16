//
//  SettingGameViewTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import XCTest
@testable import GameMemory

final class SettingGameViewTests: XCTestCase {
    
    func test_settingGameView_ckeckClickSaveButton() {
        let sut = SettingGameView()
        let spy = SettingGameViewSpy()
        
        sut.delegate = spy
        sut.actionClickButtonSave()
        
        XCTAssertTrue(spy.ckeckClickSaveButton)
    }
    
    func test_settingGameView_checkClickResetButton() {
        let sut = SettingGameView()
        let spy = SettingGameViewSpy()
        
        sut.delegate = spy
        sut.actionClickButtonReset()
        
        XCTAssertTrue(spy.checkClickResetButton)
    }
    
    func test_check_result_clickSaveButtonScreen() {
        let sut = SettingGameView()
        let spy = SettingGameViewSpy()
        
        sut.delegate = spy
        sut.actionClickButtonSave()
        sut.delegate?.clickSaveButtonScreen(button: "teste")
        
        XCTAssertTrue(spy.checkResultButton == "teste")
    }

}
