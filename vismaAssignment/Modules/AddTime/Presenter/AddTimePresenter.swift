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
}

class AddTimePresenter {
    var interactor: AddTimeInteractor
    var router: AddTimeRouter
    weak var view: AddTimePresentation?
    var projectId: String
    
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
}

// MARK: - AddTimeInteractorOutput
extension AddTimePresenter: AddTimeInteractorOutput {
    func updateTimes() {
        router.closeAddTimeView()
    }
}
