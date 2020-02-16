//
//  AddTimeRouter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class AddTimeRouter {
    weak var view: UIViewController?

       static func setupModule(id: String) -> AddTimeViewController {
        let interactor = AddTimeInteractor(dataManager: RealmDataBase())
           let router = AddTimeRouter()
           let presenter = AddTimePresenter(interactor: interactor, router: router, id: id)
           let viewController = AddTimeViewController(presenter: presenter)

           presenter.view = viewController
           router.view = viewController
           interactor.output = presenter

           return viewController
       }
    
    func closeAddTimeView() {
        view?.navigationController?.popViewController(animated: true)
    }
}
