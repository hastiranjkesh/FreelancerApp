//
//  TimeSpentInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol TimeSpentInteractorOutput: class {
    func updateTimesList(model: [TimeModel])
}

class TimeSpentInteractor {
    
    weak var output: TimeSpentInteractorOutput?
    var dataManager: DBDataManager
    var projectId: String
    var projectName: String
    
    init(dataManager: DBDataManager, projectId: String, projectName: String) {
        self.dataManager = dataManager
        self.projectId = projectId
        self.projectName = projectName
    }
    
    func loadTimes() {
        guard let times = dataManager.getTimes(NSPredicate(format: "projId = %@", projectId)) else { return }
        output?.updateTimesList(model: times)
    }
    
    func deleteProject(model: TimeModel) {
        dataManager.deleteTime(model) {[weak self] in
            self?.loadTimes()
        }
    }
    
    func getProjectId() -> String {
        return projectId
    }
    
    func getProjectName() -> String {
        return projectName
    }
}
