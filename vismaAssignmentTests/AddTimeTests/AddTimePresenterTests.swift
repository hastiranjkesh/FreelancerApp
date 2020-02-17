//
//  AddTimePresenterTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class AddTimePresenterTests: XCTestCase {
    
    class MockAddTimeInteractor: AddTimeInteractor {
        var hours: Double = 0.0
        
        override func saveTime(date: Date, hours: Double) {
            self.hours = hours
        }
    }
    
    class MockAddTimeRouter: AddTimeRouter {
        
    }
    
    class MockAddTimePresentation: AddTimePresentation {
        var shouldShowHoursError = false
        
        func showHoursError() {
            shouldShowHoursError = true
        }
        
        func updateHoursView(hour: String) {
        } 
    }
    
    var presenter: AddTimePresenter?
    var mockInteractor = MockAddTimeInteractor(dataManager: FakeDBDataManager(), id: "ProjectId_1234")
    var mockPresentation: MockAddTimePresentation?
    let mockRouter = MockAddTimeRouter()
    
    override func setUp() {
        presenter = AddTimePresenter(interactor: mockInteractor, router: mockRouter)
        mockPresentation = MockAddTimePresentation()
        presenter?.view = mockPresentation
        mockInteractor.output = presenter
    }
    
    func testFormattingDateSuccessfully() {
        let formater = DateFormatter()
        formater.dateFormat = "YYYY-MM-DD"
        let date = formater.date(from: "2020-02-17")!
        let formatedDate = presenter?.getFormatedDate(date: date)
        XCTAssertEqual(formatedDate, "Friday January 17 2020")
    }
    
    func testSaveTimeWithEmptyHour_ShowHoursError() {
        presenter?.saveTime(date: Date(), hours: "")
        XCTAssertTrue(mockPresentation?.shouldShowHoursError ?? false)
    }
    
    func testSaveTimeWithNilHour_ShowHoursError() {
        presenter?.saveTime(date: Date(), hours: nil)
        XCTAssertTrue(mockPresentation?.shouldShowHoursError ?? false)
    }
    
    func testSaveTimeWithValidHour_SentToInteractor() {
        presenter?.saveTime(date: Date(), hours: "5.30")
        XCTAssertEqual(mockInteractor.hours, 5.30)
    }
    
}
