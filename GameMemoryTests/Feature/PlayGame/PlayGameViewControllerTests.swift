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
    
    

}
