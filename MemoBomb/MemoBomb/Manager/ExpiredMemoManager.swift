//
//  ExpiredMemoManager.swift
//  MemoBomb
//
//  Created by lee on 2018. 2. 6..
//  Copyright © 2018년 smith. All rights reserved.
//

import Foundation
import RealmSwift

class ExpiredMemoManager {
    let realm = try! Realm()
    
    //메모 추가
    func save(objs: ExpiredMemo) {
        try! realm.write({
            realm.add(objs)
        })
    }
    
    //메모 삭제
    func deleteMemo(memo: ExpiredMemo) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    //메모 전체 불러오기
    func getMemos(type: ExpiredMemo.Type) -> Results<ExpiredMemo>? {
        return realm.objects(type)
    }
}
