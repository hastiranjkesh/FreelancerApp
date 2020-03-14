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
    let dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func makeTimeSpentViewController(projectId: String, projectName: String) -> TimeSpentViewController {
        let interactor = TimeSpentInteractor(dataManager: dataManager, projectId: projectId,
                                             projectName: projectName)
        let presenter = TimeSpentPresenter(interactor: interactor, router: self)
        let viewController = TimeSpentViewController(presenter: presenter)
        
        presenter.view = viewController
        self.view = viewController
        interactor.output = presenter
        
        return viewController
    }
    
    func showAddTimeView(id: String) {
        let router = AddTimeRouter(dataManager: dataManager)
        let addTimeVC = router.makeAddTimeViewController(id: id)
        view?.navigationController?.pushViewController(addTimeVC, animated: true)
    }
    
    func showShareActivityView(textToShare: String) {
        let objectsToShare = [textToShare]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare,
                                                              applicationActivities: nil)
        view?.present(activityViewController, animated: true, completion: nil)
    }
}
