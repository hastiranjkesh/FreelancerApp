//
//  TimeModel.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

struct TimeModel {
    let date: Date
    let hours: Double
    let projectId: String
}

extension TimeModel {
    init(entity: TimeEntity) {
        date = entity.date
        hours = entity.hours
        projectId = entity.project.first?.projId ?? ""
    }
}
