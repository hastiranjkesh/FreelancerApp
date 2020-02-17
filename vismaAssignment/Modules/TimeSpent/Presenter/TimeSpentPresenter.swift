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
    var times = [TimeModel]()
    
    init(interactor: TimeSpentInteractor, router: TimeSpentRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func setupView() {
        interactor.loadTimes()
    }
    
    func showAddTimeView() {
        router.showAddTimeView(id: interactor.getProjectId())
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
    
    func deleteTime(indexPath: IndexPath) {
        interactor.deleteTime(model: times[indexPath.row])
    }
    
    func getProjectName() -> String {
        return interactor.getProjectName()
    }
    
    func shareTimes() {
        let text = "Project name: " + interactor.getProjectName() + ", Total hours: " + generateTotalHours()
        router.showShareActivityView(textToShare: text)
    }
}

// MARK: - TimeSpentInteractorOutput
extension TimeSpentPresenter: TimeSpentInteractorOutput {
    func updateTimesList(model: [TimeModel]) {
        times = model
        view?.updateTimes(totalHours: generateTotalHours())
    }
}
