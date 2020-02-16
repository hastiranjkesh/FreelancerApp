//
//  ProjectsInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol ProjectsInteractorOutput: class {
    func updateProjectsList(projects: [ProjectModel])
}

class ProjectsInteractor {
    weak var output: ProjectsInteractorOutput?
    var dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func loadProjects() {
        guard let projects = dataManager.getProjects(nil) else { return }
        output?.updateProjectsList(projects: projects)
    }
}
