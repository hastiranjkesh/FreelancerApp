//
//  TimeEntity.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import RealmSwift

class TimeEntity: Object {
    typealias PrimaryKeyType = String
    
    @objc dynamic var date: Date = Date()
    @objc dynamic var hours: Double = 0.0
    @objc dynamic var timeId: PrimaryKeyType = UUID().uuidString
    
    override class func primaryKey() -> String? {
        return "timeId"
    }
    
    required init() {}
}

extension TimeEntity {
    convenience init(model: TimeModel) {
        self.init()
        date = model.date
        hours = model.hours
    }
}

