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
    var id = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let text = memoManager.getText(id: id)
        contentsView.text = text
        contentsView.becomeFirstResponder()

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
