//
//  HomeGameModelFixtures.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import Foundation
@testable import GameMemory

extension HomeGameModel {
    static func HomeGameFixture(numberElemts: String = "10",
                                numberAcert: Int = 20,
                                time: String = "01:20:30") -> Self {
        .init(numberElemts: numberElemts,
              numberAcert: numberAcert,
              time: time)
    }
}
