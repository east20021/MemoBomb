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
    private var count:Double = (24 * 60 * 60)
    private var date = 0.0
    var id = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let text = memoManager.getText(id: id)
        contentsView.text = text
        contentsView.becomeFirstResponder()
        
        date = timeDiff(memo:memoManager.getMemo(id: id))
        dateLabel.text = timeString(time: count - date)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(setTimer(notfication:)), name: .count, object: nil)

    }
    
    @objc func setTimer(notfication : NSNotification) {
        date = timeDiff(memo:memoManager.getMemo(id: id))
        dateLabel.text = timeString(time: count - date)
    }
    
    func timeDiff(memo: Memo) -> Double {
        
        let date = memoManager.getDate(memo: memo)
        let currentDate = Date()
        
        let diffsec = currentDate.timeIntervalSince(date)
        
        return diffsec
    }
    
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
    static let count = Notification.Name("count")
}


