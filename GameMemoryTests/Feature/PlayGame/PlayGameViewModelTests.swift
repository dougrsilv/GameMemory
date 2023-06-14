//
//  PlayGameViewModelTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import XCTest
@testable import GameMemory

final class PlayGameViewModelTests: XCTestCase {

    func test_call_func_onPlayGame() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        sut.fetchPlayGame()
        
        XCTAssertTrue(spy.checkCallOnPlayGame)
    }
    
    func test_call_func_acertGamer() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        sut.equalReults()
        
        XCTAssertTrue(spy.checkCallAcertGamer)
    }
    
    func test_call_func_errorGamer() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        sut.delegate?.errorGamer()
        
        XCTAssertTrue(spy.checkCallErrorGamer)
    }
    
    func test_call_func_timeValue() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        sut.timerCounter()
        
        XCTAssertTrue(spy.checkCallTimeValue)
    }
    
    func test_call_func_recorLevel() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        sut.recordMatchLevel()
        
        XCTAssertTrue(spy.checkCallRecorLevel)
    }
    
    func test_check_listPlayGame() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        
        var playGame: [PlayGameModel] = []
        let model = PlayGameModel(count: 200)
        playGame.append(model)
        
        sut.delegate?.onPlayGame(list: playGame)
        
        XCTAssertTrue(spy.checkValueList[0].count == 200)
    }
    
    func test_check_timeValue() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        
        sut.delegate?.timeValue(time: "10:20:30")
        
        XCTAssert(spy.checkValueTime == "10:20:30")
    }
    
    func test_check_recorLevel() {
        let sut = PlayGamesViewModel(count: "4")
        let spy = PlayGamesViewModelOutputSpy()
        sut.delegate = spy
        
        sut.delegate?.recorLevel(record: "101")
        
        XCTAssert(spy.checkValueRecord == "101")
    }
    
    func test_check_listNotNil() {
        let sut = PlayGamesViewModel(count: "4")
        sut.fetchPlayGame()
        sut.startNumber()
        
        XCTAssertTrue(sut.newSelectNumber != [])
    }
    
    func test_check_method_resetAtAllListGameAndStartNumber() {
        let sut = PlayGamesViewModel(count: "4")
        sut.fetchPlayGame()
        sut.startNumber()
        sut.addListOptionUser(add: 4)
        sut.resetAtAllListGameAndStartNumber()
        
        XCTAssertTrue(sut.optionUser == [])
        XCTAssertTrue(sut.newSelectNumber != [])
    }
    
    func test_check_method_resetListOptionUser() {
        let sut = PlayGamesViewModel(count: "4")
        sut.fetchPlayGame()
        sut.startNumber()
        sut.addListOptionUser(add: 4)
        sut.resetListOptionUser()
        
        XCTAssertTrue(sut.optionUser == [])
    }
    
    func test_check_method_addListOptionUser() {
        let sut = PlayGamesViewModel(count: "4")
        sut.addListOptionUser(add: 3)
        
        XCTAssertTrue(sut.optionUser == [3])
    }
    
    func test_check_method_countSelectNumber() {
        let sut = PlayGamesViewModel(count: "4")
        sut.startNumber()
        
        XCTAssertTrue(sut.countSelectNumber() == "1")
    }
}
