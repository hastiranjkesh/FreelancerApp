//
//  ProjectsPresenter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol ProjectsPresentation: class {
    func updateProjectsView(showEmptyState: Bool)
}

class ProjectsPresenter {
    
    var interactor: ProjectsInteractor
    var router: ProjectsRouter
    weak var view: ProjectsPresentation?
    var projects = [ProjectModel]()
    
    init(interactor: ProjectsInteractor, router: ProjectsRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func setupView() {
        interactor.loadProjects()
    }
    
    func showAddProjectView() {
        router.showAddProjectView()
    }
    
    func deleteProject(indexPath: IndexPath) {
        let entity = projects[indexPath.row]
        interactor.deleteProject(model: entity)
    }
    
    func projectDidSelect(indexPath: IndexPath) {
        let entity = projects[indexPath.row]
        router.showTimeSpentView(projectId: entity.id)
    }
}

// MARK: - ProjectsInteractorOutput
extension ProjectsPresenter: ProjectsInteractorOutput {
    func updateProjectsList(projects: [ProjectModel]) {
        self.projects = projects
        var showEmptyState = false
        if projects.count == 0 {
            showEmptyState = true
        }
        view?.updateProjectsView(showEmptyState: showEmptyState)
    }
}
