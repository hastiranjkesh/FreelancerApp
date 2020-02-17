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
    func updateHoursView(hour: String)
}

class AddTimePresenter {
    var interactor: AddTimeInteractor
    var router: AddTimeRouter
    weak var view: AddTimePresentation?
    
    init(interactor: AddTimeInteractor, router: AddTimeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func getFormatedDate(date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        return formater.string(from: date)
    }
    
    func saveTime(date: Date, hours: String?) {
        if validateUserInputs(hours: hours) {
            if let hoursStr = hours, let hoursValue = Double(hoursStr) {
                interactor.saveTime(date: date, hours: hoursValue)
            }
        } else {
            view?.showHoursError()
        }
    }
    
    private func validateUserInputs(hours: String?) -> Bool {
        if let text = hours, !text.isEmpty, text != "0.0" {
            return true
        }
        return false
    }
    
    func updateHourValue(hour: String) {
        interactor.updateHourValue(hour: hour)
    }
    
    func updateMinuteValue(min: String) {
        interactor.updateMinuteValue(min: min)
    }
}

// MARK: - AddTimeInteractorOutput
extension AddTimePresenter: AddTimeInteractorOutput {
    func updateTimes() {
        router.closeAddTimeView()
    }
    
    func updateHours(hour: String) {
        view?.updateHoursView(hour: hour)
    }
}
