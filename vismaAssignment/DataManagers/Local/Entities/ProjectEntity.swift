//
//  ProjectEntity.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import RealmSwift

class ProjectEntity: Object {
    typealias PrimaryKeyType = String
    
    @objc dynamic var name: String = ""
    @objc dynamic var customerPhone: String = ""
    @objc dynamic var projId: PrimaryKeyType = UUID().uuidString
    let times = List<TimeEntity>()
    
    override class func primaryKey() -> String? {
        return "projId"
    }
    
    required init() {}
}

extension ProjectEntity {
    convenience init(model: ProjectModel) {
        self.init()
        name = model.name
        customerPhone = ""
        projId = model.id
    }
}
