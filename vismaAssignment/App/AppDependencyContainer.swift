//
//  AppDependencyContainer.swift
//  vismaAssignment
//
//  Created by hasti on 3/14/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

class AppDependencyContainer {
    
    private let dataManager: DBDataManager
    
    init() {
        dataManager = RealmDataBase()
    }
    
    func makeProjectsViewController() -> ProjectsViewController {
        return ProjectsRouter.setupModule(dataManager: dataManager)
    }
}
