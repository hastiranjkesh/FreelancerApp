//
//  ProjectModelTest.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import XCTest
@testable import vismaAssignment

class ProjectModelTest: XCTestCase {

    func testProjectSetGet() {
        let project = ProjectModel(name: "Visma Time Registration", hours: 12.0, id: "1234")
        XCTAssertEqual(project.name, "Visma Time Registration")
        XCTAssertEqual(project.hours, 12.0)
        XCTAssertEqual(project.id, "1234")
    }
}

