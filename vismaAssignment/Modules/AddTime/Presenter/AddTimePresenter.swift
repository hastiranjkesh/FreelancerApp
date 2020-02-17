//
//  AddTimePresenter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol AddTimePresentation: class {
    func showHoursError()
    func updateHours(hour: String)
}

class AddTimePresenter {
    var interactor: AddTimeInteractor
    var router: AddTimeRouter
    weak var view: AddTimePresentation?
    var projectId: String
    var time: Float = 0.0
    var hoursValue: Float = 0 {
        didSet { produceHoursText() }
    }
    var minutesValue: Float = 0 {
        didSet { produceHoursText() }
    }
    
    init(interactor: AddTimeInteractor, router: AddTimeRouter, id: String) {
        self.interactor = interactor
        self.router = router
        self.projectId = id
    }
    
    func getFormatedDate(date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        return formater.string(from: date)
    }
    
    func saveTime(date: Date, hours: String?) {
        if validateUserInputs(hours: hours) {
            if let hoursValue = hours {
                if let hoursValue = Double(hoursValue) {
                    let timeModel = TimeModel(date: date, hours: hoursValue, projectId: projectId)
                    interactor.saveTime(time: timeModel)
                }
            }
            
        } else {
            view?.showHoursError()
        }
    }
    
    private func validateUserInputs(hours: String?) -> Bool {
        if let text = hours, !text.isEmpty {
            return true
        }
        return false
    }
    
    private func produceHoursText() {
        time = hoursValue + round((minutesValue/60)*100)/100
        view?.updateHours(hour: "\(time)")
    }
    
    func updateHourValue(hour: String) {
        hoursValue = hour.isEmpty ? 0 : Float(hour) ?? 0
    }
    
    func updateMinuteValue(min: String) {
        minutesValue = min.isEmpty ? 0 : Float(min) ?? 0
    }
}

// MARK: - AddTimeInteractorOutput
extension AddTimePresenter: AddTimeInteractorOutput {
    func updateTimes() {
        router.closeAddTimeView()
    }
}
