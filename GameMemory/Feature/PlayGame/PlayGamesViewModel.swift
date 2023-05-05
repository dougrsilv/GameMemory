//
//  PlayGamesViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 26/04/23.
//

import UIKit

protocol PlayGamesViewModelOutput: AnyObject {
    func onPlayGame(list: [PlayGameModel])
}

class PlayGamesViewModel {
    
    private var playGameModel: [PlayGameModel] = []
    private var num: String = ""
    var newSelectNumber: [Int] = []
    var optionUser: [Int] = []
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
        if let value = Int(num) {
            let list = Int.random(in: 0...value - 1)
            newSelectNumber.append(list)
        }
    }
    
    func equalReults(count: Int) -> Bool? {
        if newSelectNumber.count == count {
            return newSelectNumber.elementsEqual(optionUser)
        }
        return nil
    }
    
    func processData(count: Int) {
        _ = ProcessData(viewModel: count)
    }
}
