//
//  MemoViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 19..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    
    
    @IBOutlet weak var contentsView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
