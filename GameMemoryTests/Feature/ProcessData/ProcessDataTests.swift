//
//  ProcessDataTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 14/06/23.
//

import XCTest
@testable import GameMemory

final class ProcessDataTests: XCTestCase {
    
    func test_init_processData() {
        _ = ProcessData(elements: "101",
                                      level: 46,
                                      time: "01:02:03")
        
        let elements = UserDefaults.standard.string(forKey: "elements") ?? "0"
        let level = UserDefaults.standard.integer(forKey: "level")
        let time = UserDefaults.standard.string(forKey: "time") ?? "00:00:00"
        
        XCTAssertTrue(elements == "101")
        XCTAssertTrue(level == 46)
        XCTAssertTrue(time == "01:02:03")
    }
}
