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
    
    private var memoManager = MemoManager()
    var id = ""
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
