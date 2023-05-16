//
//  PlayGamesViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 26/04/23.
//

import UIKit

protocol PlayGamesViewModelOutput: AnyObject {
    func onPlayGame(list: [PlayGameModel])
    func acertGamer()
    func errorGamer()
    func timeValue(time: String)
    func recorLevel(record: String)
}

class PlayGamesViewModel {
    
    private var playGameModel: [PlayGameModel] = []
    private var num: String = ""
    private var timeRec: String = ""
    var timer: Timer = Timer()
    var count: Int = 0
    var newSelectNumber: [Int] = []
    var optionUser: [Int] = []
    var disableRepeatButton = true
    var disableContinueButton =  false
   
    weak var delegate: PlayGamesViewModelOutput?
    
    init(count: String) {
        for countCicle in 1...(Int(count) ?? 0) {
            let model = PlayGameModel(count: countCicle)
            self.playGameModel.append(model)
        }
        num = count
    }
    
    private func convertValueInttoString(value: String) -> Int {
        guard let value = Int(value) else { return 0 }
        return value
    }
    
    func fetchPlayGame() {
        delegate?.onPlayGame(list: playGameModel)
    }
    
    func startNumber() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let value = Int(self.num) {
                let list = Int.random(in: 0...value - 1)
                self.newSelectNumber.append(list)
            }
        }
    }
    
    func equalReults() {
        if newSelectNumber.count == optionUser.count {
            switch newSelectNumber.elementsEqual(optionUser) {
            case true:
                startNumber()
                resetListOptionUser()
                processData()
                delegate?.acertGamer()
            case false:
                delegate?.errorGamer()
            }
        }
    }
    
    func processData() {
        let count = UserDefaults.standard.integer(forKey: "level")
        if count < newSelectNumber.count {
            _ = ProcessData(elements: num,
                            level: newSelectNumber.count,
                            time: timeRec)
        }
    }
    
    func recordMatchLevel() {
        let count = UserDefaults.standard.integer(forKey: "level")
        let convertResultString = String(count)
        delegate?.recorLevel(record: convertResultString)
    }
    
    func resetAtAllListGameAndStartNumber() {
        newSelectNumber.removeAll()
        optionUser.removeAll()
        startNumber()
    }
    
    func resetListOptionUser() {
        optionUser.removeAll()
    }
    
    func addListOptionUser(add: Int) {
        optionUser.append(add)
    }
    
    func countSelectNumber() -> String {
        return String(newSelectNumber.count)
    }
    
    func timerCount() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    @objc func timerCounter() {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeRec = timeString
        delegate?.timeValue(time: timeString)
    }
}
