//
//  HomeGameViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 05/05/23.
//

import Foundation

protocol HomeGameViewModelInput {
    var delegate:  HomeGameViewModelOutput? { get set }
    func updateResult()
    func saveResultButtons() -> String
    func navigationSettingGame(delegate: SettingGameViewControllerDelegate)
    func navigationPlayGame()
}

protocol HomeGameViewModelOutput: AnyObject {
    func onNumberAcert(number: HomeGameModel?)
}

class HomeGameViewModel: HomeGameViewModelInput {
  
    weak var delegate: HomeGameViewModelOutput?
    private var userDefaults : UserDefaults
    var coordinator: HomeGameCoordinator?
    
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
        let value = userDefaults.string(forKey:  "button") ?? "1"
        if value == "" {
            return "1"
        }
        return value
    }
    
    func navigationSettingGame(delegate: SettingGameViewControllerDelegate) {
        coordinator?.startSettingGame(delegate: delegate)
    }
    
    func navigationPlayGame() {
        coordinator?.startPlayGame(parameter: saveResultButtons())
    }
}
