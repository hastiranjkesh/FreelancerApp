//
//  ProjectModel.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Foundation

struct ProjectModel {
    let name: String
    var hours: Double = 0.0
    var id: String = UUID().uuidString
}

extension ProjectModel {
    init(entity: ProjectEntity) {
        name = entity.name
        id = entity.projId
        hours = 0.0
        for time in entity.times {
            hours += time.hours
        }
    }
}
