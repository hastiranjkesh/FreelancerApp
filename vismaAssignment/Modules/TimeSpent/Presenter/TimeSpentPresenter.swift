//
//  TimeSpentPresenter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

protocol TimeSpentPresentation: class {
    func updateTimes(totalHours: String)
}

class TimeSpentPresenter {
    
    var interactor: TimeSpentInteractor
    var router: TimeSpentRouter
    weak var view: TimeSpentPresentation?
    var projectId: String
    var times = [TimeModel]()
    
    init(interactor: TimeSpentInteractor, router: TimeSpentRouter, projectId: String) {
        self.interactor = interactor
        self.router = router
        self.projectId = projectId
    }
    
    func setupView() {
        interactor.loadTimes(projectId: projectId)
    }
    
    func showAddTimeView() {
        router.showAddTimeView(id: projectId)
    }
    
    func generateTotalHours() -> String {
        var totalHours = 0.0
        for time in times {
            totalHours += time.hours
        }
        return "\(totalHours) hours"
    }
    
    func getFormatedDate(date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MMMM dd Y"
        return formater.string(from: date)
    }
}

// MARK: - TimeSpentInteractorOutput
extension TimeSpentPresenter: TimeSpentInteractorOutput {
    func updateTimesList(model: [TimeModel]) {
        times = model
        view?.updateTimes(totalHours: generateTotalHours())
    }
}
