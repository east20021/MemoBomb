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
    var text = ""
    let memoManager = MemoManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentsView.text = text
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
