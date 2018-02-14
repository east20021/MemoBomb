//
//  expiredMemo.swift
//  MemoBomb
//
//  Created by lee on 2018. 2. 6..
//  Copyright © 2018년 smith. All rights reserved.
//

import Foundation
import RealmSwift


class ExpiredMemo: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date: Date = Date()
    @objc dynamic var time: Int = 0
    @objc dynamic var renewalNum: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
