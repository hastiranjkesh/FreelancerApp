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
    
    static func setupModule(projectId: String, projectName: String) -> TimeSpentViewController {
        let interactor = TimeSpentInteractor(dataManager: RealmDataBase(), projectId: projectId,
                                             projectName: projectName)
        let router = TimeSpentRouter()
        let presenter = TimeSpentPresenter(interactor: interactor, router: router)
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
    
    func showShareActivityView(textToShare: String) {
        let objectsToShare = [textToShare]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare,
                                                              applicationActivities: nil)
        view?.present(activityViewController, animated: true, completion: nil)
    }
}
