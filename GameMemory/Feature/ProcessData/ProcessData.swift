//
//  ProcessData.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 05/05/23.
//

import UIKit

class ProcessData {
    
    init(elements: String, level: Int, time: String) {
        saveDataResult(elements: elements, level: level, time: time)
    }
    
    func saveDataResult(elements: String, level: Int, time: String) {
        UserDefaults.standard.set(elements, forKey: "elements")
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(time, forKey: "time")
    }
}
