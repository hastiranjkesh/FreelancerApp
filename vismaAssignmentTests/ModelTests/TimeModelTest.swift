//
//  TimeModelTest.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class TimeModelTest: XCTestCase {
    
    func testTimeSetGet() {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        let date = formater.date(from: "Sunday February 16 2020")!
        
        let time = TimeModel(date: date, hours: 6.0, projectId: "1234", timeId: "abcd")
        XCTAssertEqual(time.date, date)
        XCTAssertEqual(time.hours, 6.0)
        XCTAssertEqual(time.projectId, "1234")
    }
}
