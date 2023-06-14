//
//  PlayGamesViewModelInputSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 13/06/23.
//

import Foundation
@testable import GameMemory

final class PlayGamesViewModelInputSpy: PlayGamesViewModelInput {
 
    var delegate: PlayGamesViewModelOutput?
    
    private(set) var playGameModel: [PlayGameModel] = []
    private(set) var num: String = ""
    private(set) var timeRec: String = ""
    private(set) var optionUser: [Int] = []
    
    var disableRepeatButton: Bool = false
    var disableContinueButton: Bool = false
    var count: Int = 0
    var newSelectNumber: [Int] = []
    var timer: Timer = Timer()
    
    private(set) var checkCallFuncFetchPlayGame: Bool = false
    private(set) var checkCallFuncStartNumber: Bool = false
    private(set) var checkCallFuncEqualReults: Bool = false
    private(set) var checkCallFuncProcessData: Bool = false
    private(set) var checkCallFuncRecordMatchLevel: Bool = false
    private(set) var checkCallFuncResetAtAllListGameAndStartNumber: Bool = false
    private(set) var checkCallFuncResetListOptionUser: Bool = false
    private(set) var checkCallFuncAddListOptionUser: Bool = false
    private(set) var checkCallFuncCountSelectNumber: Bool = false
    private(set) var checkCallFuncTimerCount: Bool = false
    private(set) var checkCallFuncSecondsToHoursMinutesSeconds: Bool = false
    private(set) var checkCallFuncMakeTimeString: Bool = false
    
    func fetchPlayGame() {
        checkCallFuncFetchPlayGame = true
    }
    
    func startNumber() {
        checkCallFuncStartNumber = true
    }
    
    func equalReults() {
        checkCallFuncEqualReults = true
    }
    
    func processData() {
        checkCallFuncProcessData = true
    }
    
    func recordMatchLevel() {
        checkCallFuncRecordMatchLevel = true
    }
    
    func resetAtAllListGameAndStartNumber() {
        checkCallFuncResetAtAllListGameAndStartNumber = true
    }
    
    func resetListOptionUser() {
        checkCallFuncResetListOptionUser = true
    }
    
    func addListOptionUser(add: Int) {
        checkCallFuncAddListOptionUser = true
    }
    
    func countSelectNumber() -> String {
        checkCallFuncCountSelectNumber = true
        return ""
    }
    
    func timerCount() {
        checkCallFuncTimerCount = true
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        checkCallFuncSecondsToHoursMinutesSeconds = true
        return (1, 1, 1)
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        checkCallFuncMakeTimeString = true
        return ""
    }
}
