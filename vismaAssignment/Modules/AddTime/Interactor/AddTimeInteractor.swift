//
//  AddTimeInteractor.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol AddTimeInteractorOutput: class {
    func updateTimes()
}

class AddTimeInteractor {
    weak var output: AddTimeInteractorOutput?
    var dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func saveTime(time: TimeModel) {
        dataManager.updateProjectWithTime(time.projectId, time: time)
        output?.updateTimes()
    }
}
