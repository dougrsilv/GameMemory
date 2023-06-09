//
//  HomeGameViewModelTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 07/06/23.
//

import XCTest
@testable import GameMemory

final class HomeGameViewModelTests: XCTestCase {
    
    func test_check_updateResult() {
        let sut = HomeGameViewModel()
        let spy = HomeGameViewModelOutputSpy()
        sut.delegate = spy
        sut.updateResult()
        XCTAssertTrue(spy.checkOnNumberAcert)
    }
    
    func test_check_data_userDefault() {
        
        UserDefaults.standard.set("100", forKey: "elements")
        UserDefaults.standard.set(50, forKey: "level")
        UserDefaults.standard.set("01:10:20", forKey: "time")
        
        let sut = HomeGameViewModel(userDefaults: .standard)
        let spy = HomeGameViewModelOutputSpy()
        sut.delegate = spy
        sut.updateResult()
        
        XCTAssert( spy.didCheckValueHomeGameModelElements == "100")
        XCTAssert( spy.didCheckValueHomeGameModelLevel == 50)
        XCTAssert( spy.didCheckValueHomeGameModelTime == "01:10:20")
    }
    
    func test_check_saveResultButtons() {
        UserDefaults.standard.set("10", forKey: "button")
        
        let sut = HomeGameViewModel(userDefaults: .standard)
        XCTAssert( sut.saveResultButtons() == "10")
    }
}
