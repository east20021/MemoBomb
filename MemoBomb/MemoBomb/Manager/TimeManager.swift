//
//  timeManager.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 25..
//  Copyright © 2018년 smith. All rights reserved.
//

import Foundation

class TimeManager {
    
    func setDeleteTime() -> Double {
        return (24 * 60 * 60)
    }
    
    func timeDiff(memo: Memo) -> Double {
        let date = memo.date
        let currentDate = Date()
        let diffseconds = currentDate.timeIntervalSince(date)
        return diffseconds
    }
    
    func remainSeconds(memo: Memo) -> Double{
        return (self.setDeleteTime() - self.timeDiff(memo: memo))
    }
    
    //00:00:00 포멧 적용
    func timeString (time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}
