//
//  HomeGameViewInputSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 12/06/23.
//

import Foundation
@testable import GameMemory

final class HomeGameViewInputSpy: HomeGameViewInput {
    
    var delegate: HomeGameViewOutput?
    private(set) var checkValueSetupData: Bool = false
    
    func setupData(setup: GameMemory.HomeGameModel?) {
        checkValueSetupData = true
    }
    
}
