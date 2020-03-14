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
    let dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }

    func makeProjectsViewController() -> ProjectsViewController {
        let interactor = ProjectsInteractor(dataManager: dataManager)
        let presenter = ProjectsPresenter(interactor: interactor, router: self)
        let viewController = ProjectsViewController(presenter: presenter)

        presenter.view = viewController
        self.view = viewController
        interactor.output = presenter

        return viewController
    }
    
    func showAddProjectView() {
        let router = AddProjectRouter(dataManager: dataManager)
        let newProjectVC = router.makeAddProjectViewController()
        let navController = UINavigationController(rootViewController: newProjectVC)
        navController.modalPresentationStyle = .fullScreen
        view?.present(navController, animated: true, completion: nil)
    }
    
    func showTimeSpentView(projectId: String, projectName: String) {
        let router = TimeSpentRouter(dataManager: dataManager)
        let timeSpentVC = router.makeTimeSpentViewController(projectId: projectId, projectName: projectName)
        view?.navigationController?.pushViewController(timeSpentVC, animated: true)
    }
}
