//
//  ProjectsInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol ProjectsInteractorOutput: class {
    var projects: [ProjectModel]? { get }
    func updateProjectsList(with projects: [ProjectModel])
}

class ProjectsInteractor {
    weak var output: ProjectsInteractorOutput?
    var dataManager: DBDataManager
    var projects: [ProjectModel]?
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func loadProjects() {
        guard let projects = dataManager.getProjects(nil) else { return }
        self.projects = projects
        output?.updateProjectsList(with: projects)
    }
    
    func deleteProject(model: ProjectModel) {
        dataManager.deleteProject(model) { [weak self] in
            self?.loadProjects()
        }
    }
}
