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
    
    private(set) var projects: [ProjectModel]? {
        didSet {
            var showEmptyState = false
            if projects?.count == 0 {
                showEmptyState = true
            }
            view?.updateProjectsView(showEmptyState: showEmptyState)
        }
    }
    
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
        guard let entity = projects?[indexPath.row] else { return }
        interactor.deleteProject(model: entity)
    }
    
    func projectDidSelect(indexPath: IndexPath) {
        guard let entity = projects?[indexPath.row] else { return }
        router.showTimeSpentView(projectId: entity.id)
    }
}

// MARK: - ProjectsInteractorOutput
extension ProjectsPresenter: ProjectsInteractorOutput {
    
    func updateProjectsList(with projects: [ProjectModel]) {
        self.projects = projects
    }
}
