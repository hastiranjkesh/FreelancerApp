//
//  ProjectsRouter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class ProjectsRouter {

    weak var view: UIViewController?

    static func setupModule() -> ProjectsViewController {
        let interactor = ProjectsInteractor(dataManager: RealmDataBase())
        let router = ProjectsRouter()
        let presenter = ProjectsPresenter(interactor: interactor, router: router)
        let viewController = ProjectsViewController(presenter: presenter)

        presenter.view = viewController
        router.view = viewController
        interactor.output = presenter

        return viewController
    }
}
