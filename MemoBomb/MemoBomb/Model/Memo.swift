//
//  Memo.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//
import Foundation
import RealmSwift



class Memo: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var dueDate: Date!
    @objc dynamic var isOpen: Bool = false
}



