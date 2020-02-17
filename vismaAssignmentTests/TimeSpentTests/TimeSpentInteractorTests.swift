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
    var projectId = "1234"
    var projectName = "Sample Project1"
    
    override func setUp() {
        subject = TimeSpentInteractor(dataManager: fakeDataManager, projectId: projectId, projectName: projectName)
        subject?.output = interactorOutput
    }
    
    func test_GetTimesForSpecificProject_CheckCount() {
        subject?.loadTimes()
        XCTAssertEqual(interactorOutput.times?.count, 3)
    }
    
    func test_GetTimesForSpecificProject_CheckId() {
        subject?.loadTimes()
        XCTAssertEqual(interactorOutput.times?.first?.projectId, projectId)
    }
    
    func test_DeleteTimeSuccessfully_CatchInInteractorOutput() {
        subject?.deleteTime(model: TimeModel(date: Date(), hours: 6.0, projectId: projectId, timeId: "abcd"))
        guard let count = interactorOutput.times?.count else {
            XCTFail("Delete Failed")
            return
        }
        XCTAssertTrue(count > 0)
    }
    
    func testGetProjectIdSuccessfully() {
        let id = subject?.getProjectId()
        XCTAssertEqual(id, projectId)
    }
    
    func testGetProjectNameSuccessfully() {
        let name = subject?.getProjectName()
        XCTAssertEqual(name, projectName)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
