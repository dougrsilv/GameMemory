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
        let count = UserDefaults.standard.integer(forKey: "contador")
        let model = HomeGameModel(numberAcert: count)
        delegate?.onNumberAcert(number: model)
    }
}
