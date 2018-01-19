//
//  MemoManager.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 20..
//  Copyright © 2018년 smith. All rights reserved.
//

import Foundation
import RealmSwift


class MemoManager {

    let realm = try! Realm()

    /**
     Delete local database
     */
    func delete() {
        try! realm.write({
            realm.deleteAll()
        })
    }

    /**
     Save array of objects to database
     */
    func save(objs: Memo) {
        try! realm.write({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(objs)
        })
    }

    /**
     Returs an array as Results<object>?
     */
    func getMemo(type: Memo.Type) -> Results<Memo>? {
        return realm.objects(type)
    }
    
    

}




