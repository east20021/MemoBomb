//
//  MemoViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 19..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift

class MemoViewController: UIViewController {

    @IBOutlet weak var contentsView: UITextView!
    
    var memoManager = MemoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func addMemo() {
        let newMemo = Memo()
        newMemo.text = contentsView.text
        memoManager.save(objs: newMemo)
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        addMemo()
        dismiss(animated: true, completion: nil)
    }
    
    
}
