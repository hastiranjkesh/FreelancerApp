//
//  TimeSpentRouter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class TimeSpentRouter {
    
    weak var view: UIViewController?

    static func setupModule(projectId: String) -> TimeSpentViewController {
        let interactor = TimeSpentInteractor(dataManager: RealmDataBase(), projectId: projectId)
        let router = TimeSpentRouter()
        let presenter = TimeSpentPresenter(interactor: interactor, router: router, projectId: projectId)
        let viewController = TimeSpentViewController(presenter: presenter)

        presenter.view = viewController
        router.view = viewController
        interactor.output = presenter

        return viewController
    }
    
    func showAddTimeView(id: String) {
        let addTimeVC = AddTimeRouter.setupModule(id: id)
        view?.navigationController?.pushViewController(addTimeVC, animated: true)
    }
}
