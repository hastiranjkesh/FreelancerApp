//
//  AddProjectPresenter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol AddProjectPresentation: class {
    func showProjectNameError()
}

class AddProjectPresenter {
    var interactor: AddProjectInteractor
    var router: AddProjectRouter
    weak var view: AddProjectPresentation?

    init(interactor: AddProjectInteractor, router: AddProjectRouter) {
        self.interactor = interactor
        self.router = router
    }

    func closeNewProjectView() {
        router.closeNewProjectView()
    }

    func saveNewProject(name: String?) {
        if validateUserInputs(name: name) {
            interactor.saveNewProject(name: name!)
        } else {
            view?.showProjectNameError()
        }
    }
    
    private func validateUserInputs(name: String?) -> Bool {
        if let projectName = name, !projectName.isEmpty {
            return true
        }
        return false
    }
}

// MARK: - AddProjectInteractorOutput
extension AddProjectPresenter: AddProjectInteractorOutput {
    func updateProjects() {
        router.closeNewProjectView()
    }
}
