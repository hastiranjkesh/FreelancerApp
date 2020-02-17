//
//  DBDataManager.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol DBDataManager {
    func getProjects(_ predicate: NSPredicate?) -> [ProjectModel]?
    func addProject(_ data: ProjectModel, update: Bool)
    func deleteProject(_ data: ProjectModel, completion: @escaping () -> Void)
    func updateProjectWithTime(_ projectId: String, time: TimeModel)
    func addTime(_ data: TimeModel, update: Bool)
    func getTimes(_ predicate: NSPredicate?) -> [TimeModel]?
    func deleteTime(_ data: TimeModel, completion: @escaping () -> Void)
}
