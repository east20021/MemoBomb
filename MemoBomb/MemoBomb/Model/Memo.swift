//
//  Memo.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//
import Foundation
import RealmSwift
/*
마이그레이션이란 Realm 데이터베이스 스키마에 변화가 생겼을 때 디스크에 쓰인 데이터와 새로운 스키마의 차이를 맞추는 작업입니다.
아직 릴리즈 이전의 개발 중이라면 시간 절약상 굳이 사용하지 않고 앱을 지웠다가 다시 설치하는 것을 추천합니다.
 단 이미 릴리즈돼서 설치된 앱의 스키마가 변경된다면 마이그레이션이 필요합니다. 스키마 변경을 한 단계 올리고 마이그레이션 내에서 어떤 작업을 할지 지정하면 됩니다.
*/


class Memo: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date: Date = Date()
    @objc dynamic var time: Int = 0
    @objc dynamic var renewalNum: Int = 0

    override class func primaryKey() -> String? {
        return "id"
    }
}

    


