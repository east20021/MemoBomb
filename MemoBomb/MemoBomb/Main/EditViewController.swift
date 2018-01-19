//
//  EditViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 19..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var memoData = [String: String]()

    @IBOutlet weak var contentsView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsView.text = memoData["contents"]
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
