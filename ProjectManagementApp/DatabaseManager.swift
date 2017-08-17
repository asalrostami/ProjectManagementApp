//
//  DatabaseManager.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import Foundation
import RealmSwift


// MARK: - Save Data

public func saveData<T>(_ response: T, isUpdate: Bool = true) {
    let realm = try! Realm()
    try! realm.write {
        realm.add(response as! Object, update: isUpdate)
    }
}

// MARK: - Read Data

public func readData<T:Object>(_ model: T.Type, predicate: String?, completion: (_ responseData:Results<T>) -> Void) {
    
    let realm = try! Realm()
    let result: Results<T>
    if let predicateString = predicate {
        result = realm.objects(model).filter(predicateString)
    } else {
        result = realm.objects(model)
    }
    completion(result)    
}

// MARK: - Delete

public func deleteRealm<T:Object>(_ model: T) {
    let realm = try! Realm()
    try! realm.write {
        realm.delete(model)
    }
}

/// #### Delete All
public func deleteAll() {
    let realm = try! Realm()
    try! realm.write {
        realm.deleteAll()
    }
    
}
/// ##### Create an id 
public func createId<T>(_ model: T , id:String) -> Int
{
    let realm = try! Realm()
    
    let allModels = realm.objects(model as! Object.Type)
    if allModels.count > 0 {
        let lastId = allModels.max(ofProperty: id) as Int?
        return lastId! + 1
    } else {
        return 1
    }
    
   
}

