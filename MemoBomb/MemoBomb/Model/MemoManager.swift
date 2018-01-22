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
    
    //메모 추가
    func save(objs: Memo) {
        try! realm.write({
            realm.add(objs)
        })
    }
    
    //메모 삭제(스와이프)
    func deleteSwipe(memo: Memo)
    {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    //메모 삭제(id값 이용)
    func delete(id: String) {
        try! realm.write {
            let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
            realm.delete(memo!)
        }
    }

    //메모 전체 불러오기
    func getMemo(type: Memo.Type) -> Results<Memo>? {
        return realm.objects(type)
    }
    
    //메모 업데이트
    func update(id: String, text: String) {
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        try! realm.write {
            memo?.text = text
        }
    }
    
    //메모 텍스트 값 불러오기
    func getText(id: String) -> String { 
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        return (memo?.text)!
    }
    
    func getDate(id: String) -> String {
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: (memo?.date)!)
    }
    
    func getDate(memo: Memo) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: (memo.date))
    }
    
    

}




