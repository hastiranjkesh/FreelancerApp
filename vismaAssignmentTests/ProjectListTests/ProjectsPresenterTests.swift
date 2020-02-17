//
//  ProjectsPresenterTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class ProjectsPresenterTests: XCTestCase {
    
    class MockProjectsInteractor: ProjectsInteractor {
    }
    
    class MockProjectsPresentation: ProjectsPresentation {
        var shouldLoadProjectListWithProjects = false
        var shouldShowEmptyStateView = false
        
        func updateProjectsView(showEmptyState: Bool) {
            shouldLoadProjectListWithProjects = !showEmptyState
            shouldShowEmptyStateView = showEmptyState
        }
    }
    
    class MockProjectsRouter: ProjectsRouter {
        var projectId: String?
        
        override func showTimeSpentView(projectId: String) {
            self.projectId = projectId
        }
    }
    
    var presenter: ProjectsPresenter?
    let mockInteractor = MockProjectsInteractor(dataManager: FakeDBDataManager())
    let fakeProjects = [
        ProjectModel(name: "project1", hours: 25, id: "1234"),
        ProjectModel(name: "project2", hours: 44, id: "1235")]
    var mockPresentation: MockProjectsPresentation?
    let mockRouter = MockProjectsRouter()
    
    override func setUp() {
        presenter = ProjectsPresenter(interactor: mockInteractor, router: mockRouter)
        mockPresentation = MockProjectsPresentation()
        presenter?.view = mockPresentation
        mockInteractor.output = presenter
    }
    
    func testSetupView() {
        presenter?.setupView()
        XCTAssertEqual(presenter?.projects?.count, 5)
    }
    
    func testProjectCountIsTwo() {
        presenter?.updateProjectsList(with: fakeProjects)
        XCTAssertEqual(presenter?.projects?.count, 2)
    }
    
    func testProjectAtIndexIsInjectedProject() {
        presenter?.updateProjectsList(with: fakeProjects)
        let project = presenter?.projects?[0]
        XCTAssertEqual(project?.name, fakeProjects[0].name)
        XCTAssertEqual(project?.hours, fakeProjects[0].hours)
    }
    
    func testSelectedProject() {
        presenter?.updateProjectsList(with: fakeProjects)
        presenter?.projectDidSelect(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertEqual(mockRouter.projectId, fakeProjects[0].id)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
}
