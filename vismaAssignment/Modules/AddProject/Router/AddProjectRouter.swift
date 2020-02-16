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

    static func setupModule() -> AddProjectViewController {
        let interactor = AddProjectInteractor(dataManager: RealmDataBase())
        let router = AddProjectRouter()
        let presenter = AddProjectPresenter(interactor: interactor, router: router)
        let viewController = AddProjectViewController(presenter: presenter)

        presenter.view = viewController
        router.view = viewController
        interactor.output = presenter

        return viewController
    }

    func closeNewProjectView() {
        view?.dismiss(animated: true, completion: nil)
    }
}
