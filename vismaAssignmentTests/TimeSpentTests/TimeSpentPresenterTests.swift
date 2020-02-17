//
//  TimeSpentPresenterTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class TimeSpentPresenterTests: XCTestCase {
    
    class MockTimeSpentInteractor: TimeSpentInteractor {
    }
    
    class MockTimeSpentPresentation: TimeSpentPresentation {
        var totalHours = ""
        
        func updateTimes(totalHours: String) {
            self.totalHours = totalHours
        }
    }
    
    class MockTimeSpentRouter: TimeSpentRouter {
    }
    
    var presenter: TimeSpentPresenter?
    var mockInteractor = MockTimeSpentInteractor(dataManager: FakeDBDataManager(), projectId: "1234")
    var mockPresentation: MockTimeSpentPresentation?
    let mockRouter = MockTimeSpentRouter()
    
    override func setUp() {
        presenter = TimeSpentPresenter(interactor: mockInteractor, router: mockRouter, projectId: "1234")
        mockPresentation = MockTimeSpentPresentation()
        presenter?.view = mockPresentation
        mockInteractor.output = presenter
    }
    
    func test_PresenterGetDataFromInteractorSuccessfully() {
        presenter?.projectId = "1234"
        presenter?.setupView()
        guard let times = presenter?.times else {
            XCTFail("Output has caught no times")
            return
        }
        XCTAssertEqual(times.count, 3)
    }
    
    func test_PresenterGetDataFromInteractor_ProduceTotalHoursForView() {
        presenter?.projectId = "1234"
        presenter?.setupView()
        guard let totalHours = mockPresentation?.totalHours else {
            XCTFail("totalHours is nil")
            return
        }
        XCTAssertEqual(totalHours, "24.0 hours")
    }
}
