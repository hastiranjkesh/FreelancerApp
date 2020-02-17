//
//  ProjectsInteractorTests.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class ProjectsInteractorTests: XCTestCase {
    
    class FakeProjectsInteractorOutput: ProjectsInteractorOutput {
        var projects: [ProjectModel]?
        
        func updateProjectsList(with projects: [ProjectModel]) {
            self.projects = projects
        }
    }
    
    struct StubProjectListResult {
        static var projects = [
            ProjectModel(name: "project1", hours: 25, id: "1234"),
            ProjectModel(name: "project2", hours: 44, id: "1235"),
            ProjectModel(name: "project3", hours: 7, id: "1236"),
            ProjectModel(name: "project4", hours: 13, id: "1237"),
            ProjectModel(name: "project5", hours: 39, id: "1238")]
    }
    
    var subject: ProjectsInteractor!
    let interactorOutput = FakeProjectsInteractorOutput()
    let dataManager = FakeDBDataManager()
    
    override func setUp() {
        subject = ProjectsInteractor(dataManager: dataManager)
        subject.output = interactorOutput
    }
    
    func test_GetProjectsWithSuccess_ReturnsProjectsInSubject() {
        subject.loadProjects()
        guard let projects = subject.projects else {
            XCTFail("Nil Project List Returned")
            return
        }
        XCTAssertEqual(StubProjectListResult.projects, projects)
    }
    
    func test_GetProjectsWithSuccess_ProjectsAreCaughtInSubjectOutputProtocol() {
        subject.loadProjects()
        guard let projects = interactorOutput.projects else {
            XCTFail("Output has caught no projects")
            return
        }
        XCTAssertEqual(StubProjectListResult.projects, projects)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
