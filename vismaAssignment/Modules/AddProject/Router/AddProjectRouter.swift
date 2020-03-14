//
//  AddProjectRouter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class AddProjectRouter {
    weak var view: UIViewController?
    let dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }

    func makeAddProjectViewController() -> AddProjectViewController {
        let interactor = AddProjectInteractor(dataManager: dataManager)
        let presenter = AddProjectPresenter(interactor: interactor, router: self)
        let viewController = AddProjectViewController(presenter: presenter)

        presenter.view = viewController
        self.view = viewController
        interactor.output = presenter

        return viewController
    }

    func closeNewProjectView() {
        view?.dismiss(animated: true, completion: nil)
    }
}
