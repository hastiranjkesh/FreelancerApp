//
//  TimeSpentInteractorTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation
import XCTest
@testable import vismaAssignment

class TimeSpentInteractorTests: XCTestCase {
    
    class MockTimeSpentInteractorOutput: TimeSpentInteractorOutput {
        var times: [TimeModel]?
        
        func updateTimesList(model: [TimeModel]) {
            self.times = model
        }
    }
    
    var subject: TimeSpentInteractor?
    let interactorOutput = MockTimeSpentInteractorOutput()
    let fakeDataManager = FakeDBDataManager()
    
    override func setUp() {
        subject = TimeSpentInteractor(dataManager: fakeDataManager, projectId: "1234", projectName: "project1")
        subject?.output = interactorOutput
    }
    
    func test_GetTimesForSpecificProject_CheckCount() {
        subject?.loadTimes()
        XCTAssertEqual(interactorOutput.times?.count, 3)
    }
    
    func test_GetTimesForSpecificProject_CheckId() {
        subject?.loadTimes()
        XCTAssertEqual(interactorOutput.times?.first?.projectId, "1234")
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
