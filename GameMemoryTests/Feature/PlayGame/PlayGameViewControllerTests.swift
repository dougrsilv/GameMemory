//
//  PlayGameViewControllerTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 13/06/23.
//

import XCTest
@testable import GameMemory

final class PlayGameViewControllerTests: XCTestCase {
    
    func test_call_func_fetchPlayGame() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkCallFuncFetchPlayGame)
    }
    
    func test_call_func_startNumber() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkCallFuncStartNumber)
    }
    
    func test_call_func_equalReults() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.clickSelectCorrectButton(number: 0)
        
        XCTAssertTrue(spy.checkCallFuncEqualReults)
    }
    
    func test_call_func_processData() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        
    }
    
    func test_call_func_recordMatchLevel() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkCallFuncRecordMatchLevel)
    }
    
    func test_call_func_addListOptionUser() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.clickSelectCorrectButton(number: 3)
        
        XCTAssertTrue(spy.checkCallFuncAddListOptionUser)
    }
    
    func test_call_func_timerCount() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkCallFuncTimerCount)
    }
    
    func test_poupUp_showAlert() {
        let spy = PlayGamesViewModelInputSpy()
        let sut = PlayGameViewController(viewModel: spy)
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.showAlertWithOptions(title: "Ops", text: "ops2")
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
        XCTAssertEqual(sut.presentedViewController?.title, "Ops")
    }
}
