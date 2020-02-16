//
//  ProjectsPresenter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol ProjectsPresentation: class {
    func updateProjects()
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
}

// MARK: - ProjectsInteractorOutput
extension ProjectsPresenter: ProjectsInteractorOutput {
    func updateProjectsList(projects: [ProjectModel]) {
        self.projects = projects
        view?.updateProjects()
    }
}
