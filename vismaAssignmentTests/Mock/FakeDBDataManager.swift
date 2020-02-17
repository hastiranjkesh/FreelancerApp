//
//  FakeDBDataManager.swift
//  vismaAssignmentTests
//
//  Created by hasti on 2/17/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation
@testable import vismaAssignment

class FakeDBDataManager: DBDataManager {
    func getProjects(_ predicate: NSPredicate?) -> [ProjectModel]? {
        var projects = [ProjectModel]()
        projects.append(ProjectModel(name: "project1", hours: 25, id: "1234"))
        projects.append(ProjectModel(name: "project2", hours: 44, id: "1235"))
        projects.append(ProjectModel(name: "project3", hours: 7, id: "1236"))
        projects.append(ProjectModel(name: "project4", hours: 13, id: "1237"))
        projects.append(ProjectModel(name: "project5", hours: 39, id: "1238"))
        return projects
    }
    
    func addProject(_ data: ProjectModel, update: Bool) {
    }
    
    func deleteProject(_ data: ProjectModel, completion: @escaping () -> Void) {
    }
    
    func updateProjectWithTime(_ projectId: String, time: TimeModel) {
    }
    
    func addTime(_ data: TimeModel, update: Bool) {
    }
    
    func getTimes(_ predicate: NSPredicate?) -> [TimeModel]? {
        var times = [TimeModel]()
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        times.append(TimeModel(date: formater.date(from: "Friday February 14 2020")!,
                               hours: 4.0, projectId: "1234", timeId: "abcd"))
        times.append(TimeModel(date: formater.date(from: "Saturday February 15 2020")!,
                               hours: 8.0, projectId: "1234", timeId: "abce"))
        times.append(TimeModel(date: formater.date(from: "Sunday February 16 2020")!,
                               hours: 12.0, projectId: "1234", timeId: "abcf"))
        return times
    }
    
    func deleteTime(_ data: TimeModel, completion: @escaping () -> Void) {
    }
}
