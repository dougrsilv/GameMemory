//
//  HomeGameViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 05/05/23.
//

import Foundation

protocol HomeGameViewModelOutput: AnyObject {
    func onNumberAcert(number: HomeGameModel?)
}

class HomeGameViewModel {
  
    weak var delegate: HomeGameViewModelOutput?
    private var userDefaults : UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func updateResult() {
        let elements = userDefaults.string(forKey: "elements") ?? "0"
        let level = userDefaults.integer(forKey: "level")
        let time = userDefaults.string(forKey: "time") ?? "00:00:00"
        
        let model = HomeGameModel(numberElemts: elements,
                                  numberAcert: level,
                                  time: time)
        delegate?.onNumberAcert(number: model)
    }
    
    func saveResultButtons() -> String {
        let value = UserDefaults.standard.string(forKey:  "button") ?? ""
        return value
    }
}
