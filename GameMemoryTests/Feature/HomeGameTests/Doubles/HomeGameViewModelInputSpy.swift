//
//  HomeGameViewModelInputSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import UIKit
@testable import GameMemory

class HomeGameViewModelInputSpy: HomeGameViewModelInput {
    
    var delegate: HomeGameViewModelOutput?
    private (set) var checkPassedUpdateResults: Bool = false
    private (set) var checkPassedSaveResultButtons: Bool = false
    
    func updateResult() {
        checkPassedUpdateResults = true
    }
    
    func saveResultButtons() -> String {
        checkPassedSaveResultButtons = true
        return ""
    }
    
    func navigationSettingGame(delegate: SettingGameViewControllerDelegate) {
        //
    }
    
    func navigationPlayGame() {
        //
    }
}
