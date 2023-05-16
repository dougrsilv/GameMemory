//
//  SettingGameViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 16/05/23.
//

import Foundation

class SettingGameViewModel {
    
    func saveButtonAmount(value: String) {
        UserDefaults.standard.set(value, forKey: "button")
    }
    
    func resetResultMatch() {
        UserDefaults.standard.removeObject(forKey: "elements")
        UserDefaults.standard.removeObject(forKey: "level")
        UserDefaults.standard.removeObject(forKey: "time")
    }
}
