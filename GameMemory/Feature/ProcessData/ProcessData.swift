//
//  ProcessData.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 05/05/23.
//

import UIKit

class ProcessData {
    
    private var viewModel: Int = 0
    
    init(viewModel: Int) {
        self.viewModel = viewModel
        saveDataResult(count: viewModel)
    }
    
    func saveDataResult(count: Int) {
        UserDefaults.standard.set(count, forKey: "contador")
    }
}
