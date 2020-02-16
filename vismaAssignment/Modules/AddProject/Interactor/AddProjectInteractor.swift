//
//  AddProjectInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol AddProjectInteractorOutput: class {
    func updateProjects()
}

class AddProjectInteractor {
    weak var output: AddProjectInteractorOutput?
    var dataManager: DBDataManager

    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }

    func saveNewProject(name: String) {
        let project = ProjectModel(name: name)
        dataManager.addProject(project, update: true)
        output?.updateProjects()
    }
}
