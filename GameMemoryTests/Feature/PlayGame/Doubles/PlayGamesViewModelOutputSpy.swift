//
//  PlayGamesViewModelOutputSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import UIKit
@testable import GameMemory

final class PlayGamesViewModelOutputSpy: PlayGamesViewModelOutput {
    
    private(set) var checkCallOnPlayGame: Bool = false
    private(set) var checkCallAcertGamer: Bool = false
    private(set) var checkCallErrorGamer: Bool = false
    private(set) var checkCallTimeValue: Bool = false
    private(set) var checkCallRecorLevel: Bool = false
    private(set) var checkValueList: [PlayGameModel] = []
    private(set) var checkValueTime: String?
    private(set) var checkValueRecord: String?
    
    func onPlayGame(list: [PlayGameModel]) {
        checkCallOnPlayGame = true
        checkValueList = list
    }
    
    func acertGamer() {
        checkCallAcertGamer = true
    }
    
    func errorGamer() {
        checkCallErrorGamer = true
    }
    
    func timeValue(time: String) {
        checkCallTimeValue = true
        checkValueTime = time
    }
    
    func recorLevel(record: String) {
        checkCallRecorLevel = true
        checkValueRecord = record
    }
}
