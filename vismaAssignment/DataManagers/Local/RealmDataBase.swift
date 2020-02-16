//
//  RealmDataBase.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import Realm
import RealmSwift

class RealmDataBase: DBDataManager {
    func getProjects(_ predicate: NSPredicate?) -> [ProjectModel]? {
        if !isRealmAccessible() { return nil }
        do {
            let realm = try Realm()
            realm.refresh()
            let projects = predicate == nil ? realm.objects(ProjectEntity.self) :
                realm.objects(ProjectEntity.self).filter(predicate!)
            let entities = projects.toArray()
            var models = [ProjectModel]()
            for entity in entities {
                models.append(ProjectModel(entity: entity))
            }
            return models
        } catch {
            print("Realm: Something went wrong with error: \(error)")
        }
        return nil
    }
    
    func addProject(_ data: ProjectModel, update: Bool) {
        if !isRealmAccessible() { return }
        let entity = ProjectEntity(model: data)
        addToRealm(entity: entity, update: update)
    }
    
    func deleteProject(_ data: ProjectModel, completion: @escaping () -> Void) {
        if !isRealmAccessible() { return }
        do {
            guard let project = getProjectEntities(NSPredicate(format: "projId = %@", data.id)) else { return }
            let realm = try Realm()
            realm.refresh()
            
            if realm.isInWriteTransaction {
                realm.delete(project)
                completion()
            } else {
                try? realm.write {
                    realm.delete(project)
                    completion()
                }
            }
        } catch let error {
            print("Realm: Something went wrong with error: \(error)")
        }
    }
    
    func updateProjectWithTime(_ projectId: String, time: TimeModel) {
        if let results = getProjectEntities(NSPredicate(format: "projId = %@", projectId)) {
            guard let projectEntity = Array(results).first else { return }
            if !isRealmAccessible() { return }
            
            do {
                let realm = try Realm()
                realm.refresh()
                addTime(time, update: true)
                let timeEntity = TimeEntity(model: time)
                
                if realm.isInWriteTransaction {
                    projectEntity.times.append(timeEntity)
                } else {
                    try? realm.write {
                        projectEntity.times.append(timeEntity)
                    }
                }
            } catch let error {
                print("Realm: Something went wrong with error: \(error)")
            }
        }
    }
    
    func addTime(_ data: TimeModel, update: Bool) {
        if !isRealmAccessible() { return }
        let entity = TimeEntity(model: data)
        addToRealm(entity: entity, update: update)
    }
    
    func getTimes(_ predicate: NSPredicate?) -> [TimeModel]? {
        let projectsEntities = getProjectEntities(predicate)
        guard let timesEntity = projectsEntities?.first?.times else { return nil }
        var timeModels = [TimeModel]()
        for time in Array(timesEntity) {
            timeModels.append(TimeModel(entity: time))
        }
        return timeModels
    }
    
    private func getProjectEntities(_ predicate: NSPredicate?) -> [ProjectEntity]? {
        if !isRealmAccessible() { return nil }
        do {
            let realm = try Realm()
            realm.refresh()
            let projects = predicate == nil ? realm.objects(ProjectEntity.self) :
                realm.objects(ProjectEntity.self).filter(predicate!)
            return projects.toArray()
        } catch {
            print("Realm: Something went wrong with error: \(error)")
        }
        return nil
    }
    
    private func addToRealm<T: Object>(entity: T, update: Bool) {
        do {
            let realm = try Realm()
            realm.refresh()
            if realm.isInWriteTransaction {
                realm.add(entity, update: update ? .all : .error)
            } else {
                try? realm.write {
                    realm.add(entity, update: update ? .all : .error)
                }
            }
        } catch {
            print("Realm: Something went wrong with error: \(error)")
        }
    }
    
    private func isRealmAccessible() -> Bool {
        do { _ = try Realm() } catch {
            print("Realm is not accessible")
            return false
        }
        return true
    }
    
    private func configureRealm() {
        let config = RLMRealmConfiguration.default()
        config.deleteRealmIfMigrationNeeded = true
        RLMRealmConfiguration.setDefault(config)
    }
}

extension Results {
    func toArray() -> [Element] {
        return compactMap { $0 }
    }
}
