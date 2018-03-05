//
//  MemoViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 19..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift

class NewMemoViewController: UIViewController {

    @IBOutlet weak var contentsView: UITextView!
    
    var memoManager = MemoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsView.becomeFirstResponder()
    }
    
    func addMemo() {
        let newMemo = Memo()
        newMemo.text = contentsView.text
        memoManager.save(objs: newMemo)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        NotificationCenter.default.post(name: .editDone, object: nil)
        if contentsView.text.count != 0 {
          addMemo()
        }
        contentsView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    
}
