//
//  PlayGamesViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 26/04/23.
//

import Foundation

protocol PlayGamesViewModelOutput: AnyObject {
    func onPlayGame(list: [PlayGameModel])
}

class PlayGamesViewModel {
    
    private var playGameModel: [PlayGameModel] = []
    private var num: String = ""
    private var newSelectNumber: [Int] = []
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
    
    func luckyNumber() -> Int {
        guard let value = Int(num) else { return 0 }
        return Int.random(in: 0...value - 1)
    }
    
    func addNumberSelect(add: Int) {
        newSelectNumber.append(add)
        print(newSelectNumber)
    }
    
}
