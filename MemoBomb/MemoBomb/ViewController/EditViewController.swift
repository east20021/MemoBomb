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
    @IBOutlet weak var resetButton: UIButton!
    
    private let memoManager: MemoManager = MemoManager()
    private let timeManager: TimeManager = TimeManager()
    //갱신가능시간
    private let renewableTime: Double = (6 * 60 * 60)
    
    private var remainSeconds: Double = 0.0
    private var memo: Memo = Memo()
    
    //tableView에서 EditVC로 넘어올 때 받는 id값
    var id = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        NotificationCenter.default.addObserver(self, selector: #selector(setTimer(notfication:)), name: .timer, object: nil)
    }
    
    @objc func setTimer(notfication : NSNotification) {
        setTimerSeconds()
        
        if isResetPossible() {
            resetButton.isHidden = false
        }
        if isDeleteMemo() {
            memoManager.deleteMemo(memo: memo)
            dismiss(animated: true, completion: nil)
        } else {
            dateLabel.text = timeManager.timeString(time: remainSeconds)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        memoManager.updateText(id: id, text: contentsView.text)
        contentsView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        resetButton.isHidden = true
        memoManager.updateDate(id: id, date: Date())
    }
    
    func setTimerSeconds() {
        remainSeconds = timeManager.remainSeconds(memo: memo)
    }
    
    func isResetPossible() -> Bool {
        return remainSeconds < renewableTime
    }
    
    func isDeleteMemo() -> Bool {
        return remainSeconds < 1
    }
    
    func setUI() {
        memo = memoManager.getMemo(id: id)
        setTimerSeconds()
        
        contentsView.text = memo.text
        contentsView.becomeFirstResponder()
        
        dateLabel.text = timeManager.timeString(time: remainSeconds)
        
        if isResetPossible() {
            resetButton.isHidden = false
        } else {
            resetButton.isHidden = true
        }
    }
}

extension Notification.Name {
    static let timer = Notification.Name("timer")
}


