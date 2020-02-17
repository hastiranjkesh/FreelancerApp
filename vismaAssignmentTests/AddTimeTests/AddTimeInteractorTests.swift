//
//  AddTimeInteractorTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class AddTimeInteractorTests: XCTestCase {
    
    class MockAddTimeInteractorOutput: AddTimeInteractorOutput {
        var shouldUpdateTimes = false
        var hour = ""
        
        func updateTimes() {
            shouldUpdateTimes = true
        }
        
        func updateHours(hour: String) {
            self.hour = hour
        }
    }
    
    var subject: AddTimeInteractor?
    let interactorOutput = MockAddTimeInteractorOutput()
    let fakeDataManager = FakeDBDataManager()
    
    override func setUp() {
        subject = AddTimeInteractor(dataManager: fakeDataManager, id: "ProjectId_1234")
        subject?.output = interactorOutput
    }
    
    func testSaveDataSuccessfully_CatchInInteractorOutput() {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        let date = formater.date(from: "Sunday February 16 2020")!
        subject?.saveTime(date: date, hours: 6.0)
        XCTAssertTrue(interactorOutput.shouldUpdateTimes)
    }
    
    func testUpdateHoursValueSuccessfully() {
        subject?.updateHourValue(hour: "\(4.0)")
        XCTAssertEqual(subject?.hoursValue, 4.0)
    }
    
    func testUpdateMinutssValueSuccessfully() {
        subject?.updateMinuteValue(min: "\(45.0)")
        XCTAssertEqual(subject?.minutesValue, 45.0)
    }
    
    func testSetHoursValueSuccessfully_CatchInInteractorOutput() {
        subject?.hoursValue = 7.0
        XCTAssertEqual(interactorOutput.hour, "\(7.0)")
    }
    
    func testSetMinutesValueSuccessfully_CatchInInteractorOutput() {
        subject?.minutesValue = 30.0
        XCTAssertEqual(interactorOutput.hour, "\(0.5)")
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
