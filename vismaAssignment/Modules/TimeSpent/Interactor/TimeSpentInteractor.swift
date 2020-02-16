//
//  TimeSpentInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol TimeSpentInteractorOutput: class {
    func updateTimesList(model: [TimeModel])
}

class TimeSpentInteractor {
    
    weak var output: TimeSpentInteractorOutput?
    var dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func loadTimes(projectId: String) {
    }
}
