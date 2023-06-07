//
//  SettingGameViewModel.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 16/05/23.
//

import Foundation

class SettingGameViewModel {
    
    private var userDefaults : UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveButtonAmount(value: String) {
        userDefaults.set(value, forKey: "button")
    }
    
    func resetResultMatch() {
        userDefaults.removeObject(forKey: "elements")
        userDefaults.removeObject(forKey: "level")
        userDefaults.removeObject(forKey: "time")
    }
}
