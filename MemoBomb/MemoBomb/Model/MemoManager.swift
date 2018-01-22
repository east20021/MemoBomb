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
    
    func save(objs: Memo) {
        try! realm.write({
            realm.add(objs)
        })
    }
    
    func deleteSwipe(memo: Memo)
    {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    func delete(id: String) {
        try! realm.write {
            let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
            realm.delete(memo!)
        }
    }

    func getMemo(type: Memo.Type) -> Results<Memo>? {
        return realm.objects(type)
    }
    
    func update(id: String, text: String) {
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        try! realm.write {
            memo?.text = text
        }
    }
    
    func getText(id: String) -> String { 
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        return (memo?.text)!
    }
    
    

}




