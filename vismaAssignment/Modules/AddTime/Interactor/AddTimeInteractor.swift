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
    func updateHours(hour: String)
}

class AddTimeInteractor {
    weak var output: AddTimeInteractorOutput?
    var dataManager: DBDataManager
    
    var projectId: String
    var hoursValue: Float = 0 {
        didSet { produceHoursText() }
    }
    
    var minutesValue: Float = 0 {
        didSet { produceHoursText() }
    }
    
    init(dataManager: DBDataManager, id: String) {
        self.dataManager = dataManager
        self.projectId = id
    }
    
    func saveTime(date: Date, hours: Double) {
        let timeModel = TimeModel(date: date, hours: hours,
                                  projectId: projectId, timeId: UUID().uuidString)
        dataManager.updateProjectWithTime(projectId, time: timeModel)
        output?.updateTimes()
    }
    
    private func produceHoursText() {
        let time = hoursValue + round((minutesValue/60)*100)/100
        output?.updateHours(hour: "\(time)")
    }
    
    func updateHourValue(hour: String) {
        hoursValue = hour.isEmpty ? 0 : Float(hour) ?? 0
    }
    
    func updateMinuteValue(min: String) {
        minutesValue = min.isEmpty ? 0 : Float(min) ?? 0
    }
}
