//
//  HomeGameViewModelOutputSpy.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 07/06/23.
//

import Foundation
@testable import GameMemory

class HomeGameViewModelOutputSpy: HomeGameViewModelOutput {
    
    private(set) var checkOnNumberAcert: Bool = false
    private(set) var didCheckValueHomeGameModelElements: String?
    private(set) var didCheckValueHomeGameModelLevel: Int?
    private(set) var didCheckValueHomeGameModelTime: String?
    
    func onNumberAcert(number: HomeGameModel?) {
        checkOnNumberAcert = true
        didCheckValueHomeGameModelElements = number?.numberElemts
        didCheckValueHomeGameModelLevel = number?.numberAcert
        didCheckValueHomeGameModelTime = number?.time
    }
    
}
