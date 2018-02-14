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
    
    //메모 삭제
    func deleteMemo(memo: Memo) {
        try! realm.write {
            realm.delete(memo)
        }
    }

    //메모 전체 불러오기
    func getMemos(type: Memo.Type) -> Results<Memo>? {
        return realm.objects(type)
    }
    
    //메모 업데이트
    func updateText(memo: Memo, text: String) {
        try! realm.write {
            memo.text = text
        }
    }
    
    func updateDate(memo: Memo, date: Date) {
        try! realm.write {
            memo.date = date
        }
    }
    
    func updateRenewalNum(memo: Memo, renewalNum: Int) {
        try! realm.write {
            memo.renewalNum = renewalNum
        }
    }
    
    //메모 텍스트 값 불러오기
    func getText(id: String) -> String { 
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        return (memo?.text)!
    }
    
    //메모의 Date값 String 값으로 표시
    func getDateString(memo: Memo) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: (memo.date))
    }
    
    func getMemo(id: String) -> Memo {
        let memo = realm.object(ofType: Memo.self, forPrimaryKey: id)
        return memo!
    }

}




