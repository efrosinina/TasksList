//
//  RealmManager.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 10/07/2023.
//

import RealmSwift

let realm = try! Realm()

class RealmManager {
    // MARK: - Static Methods
    static func saveTask(task: String) {
        try! realm.write {
            let newTask = TaskList(value: ["task" : task])
            realm.add(newTask)
        }
    }
    
    static func deleteTask(_ task: TaskList) {
        try! realm.write {
            realm.delete(task)
        }
    }
}
