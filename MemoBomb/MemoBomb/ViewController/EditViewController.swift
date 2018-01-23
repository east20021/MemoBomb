//
//  EditViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 19..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var contentsView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var memoManager = MemoManager()
    private var currentDate = 0.0
    private let setTime: Double = (24 * 60 * 60)
    
    //tableView에서 받는 데이터
    var id = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let text = memoManager.getText(id: id)
        contentsView.text = text
        contentsView.becomeFirstResponder()
        
        currentDate = timeDiff(memo:memoManager.getMemo(id: id))
        dateLabel.text = timeString(time: setTime - currentDate)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setTimer(notfication:)), name: .timer, object: nil)

    }
    
    @objc func setTimer(notfication : NSNotification) {
        let memo: Memo = memoManager.getMemo(id: id)
        currentDate = timeDiff(memo:memo)
        if setTime - currentDate < 1 {
            memoManager.delete(id: id)
            dismiss(animated: true, completion: nil)
        } else {
            dateLabel.text = timeString(time: setTime - currentDate)
        }
    }
    
    func timeDiff(memo: Memo) -> Double {
        let date = memoManager.getDate(memo: memo)
        let currentDate = Date()
        let diffseconds = currentDate.timeIntervalSince(date)
        return diffseconds
    }
    
    //00:00:00 포멧 적용
    func timeString (time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @IBAction func backButton(_ sender: Any) {
        memoManager.update(id: id, text: contentsView.text)
        contentsView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        memoManager.delete(id: id)
        contentsView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
}

extension Notification.Name {
    static let timer = Notification.Name("timer")
}


