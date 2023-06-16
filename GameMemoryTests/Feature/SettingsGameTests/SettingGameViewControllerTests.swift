//
//  SettingGameViewControllerTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import XCTest
@testable import GameMemory

final class SettingGameViewControllerTests: XCTestCase {
    
    func test_delegate_settingGame() {
        let viewModel = SettingGameViewModel()
        let sut = SettingGameViewController(viewModel: viewModel)
        let spy = SettingGameViewControllerDelegateSpy()
        sut.delegate = spy
        
        sut.clickResetButton()
        XCTAssertTrue(spy.checkPassedResetMatch)
    }
    
    func test_loadView() {
        let viewModel = SettingGameViewModel()
        let sut = SettingGameViewController(viewModel: viewModel)
        XCTAssertTrue(sut.view != nil)
    }
    
    func test_poupUp_showAlert() {
        let viewModel = SettingGameViewModel()
        let sut = SettingGameViewController(viewModel: viewModel)
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.clickSaveButtonScreen(button: "0")
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
        XCTAssertEqual(sut.presentedViewController?.title, "Aviso")
    }
    
    func test_poupUp_noshowAlert() {
        let viewModel = SettingGameViewModel()
        let sut = SettingGameViewController(viewModel: viewModel)
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.clickSaveButtonScreen(button: "1")
        
        XCTAssertTrue(sut.presentedViewController is UIAlertController == false)
    }
}
