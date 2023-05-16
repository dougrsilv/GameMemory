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
    
    func updateResult() {
        let elements = UserDefaults.standard.string(forKey: "elements") ?? "0"
        let level = UserDefaults.standard.integer(forKey: "level")
        let time =  UserDefaults.standard.string(forKey: "time") ?? "00:00:00"
        
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
