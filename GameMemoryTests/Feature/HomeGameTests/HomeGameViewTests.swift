//
//  HomeGameViewTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import XCTest
@testable import GameMemory

final class HomeGameViewTests: XCTestCase {
    
    func test_check_call_clickButtonStartGame() {
        let homeGameView = HomeGameView()
        let homeGameViewDelegateSpy = HomeGameViewDelegateSpy()
        homeGameView.delegate = homeGameViewDelegateSpy
        homeGameView.actionClickButtonStart()
        
        XCTAssertTrue(homeGameViewDelegateSpy.checkPassedClickButtonStartGame)
    }
    
    func test_check_call_clickButtonConfiguration() {
        let homeGameView = HomeGameView()
        let homeGameViewDelegateSpy = HomeGameViewDelegateSpy()
        homeGameView.delegate = homeGameViewDelegateSpy
        homeGameView.actionClikcButtonOpenConfiguration()
        
        XCTAssertTrue(homeGameViewDelegateSpy.checkPassedClickButtonConfiguration)
    }
    
    func test_check_setupData() {
        let homeGameViewInputSpy = HomeGameViewInputSpy()
        homeGameViewInputSpy.setupData(setup: HomeGameModel.HomeGameFixture())
        
        XCTAssertTrue(homeGameViewInputSpy.checkValueSetupData)
    }
    
}
