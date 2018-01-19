//
//  ViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    
    private var realm: Realm!
    private var contentsList: Results<Memo>!
    private var token: NotificationToken!
    
    private var memoManager = MemoManager()
    var memoArray = [Memo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        do {
            realm = try Realm()
        } catch {
            print("\(error)")
        }
        
        contentsList = realm.objects(Memo.self)
        
        token = contentsList.observe { notification in
            self.memoTableView.reloadData()
        }
        
        if contentsList.count == 0 {
            let memo = Memo()
            memo.text = "welcome to MemoBomb"
            memoManager.save(objs: memo)
        }
        
        
        print(NSHomeDirectory())
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    

    @IBAction func addButton(_ sender: Any) {
        let memoVC: MemoViewController = UIStoryboard(name: "Memo", bundle: nil).instantiateViewController(withIdentifier: "memoVC") as! MemoViewController
        
        self.present(memoVC, animated: true) { }
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let whiteCell = tableView.dequeueReusableCell(withIdentifier: "whiteCell", for: indexPath) as! WhiteTableViewCell
        whiteCell.textLabel?.text = contentsList[indexPath.row].text
        return whiteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            (segue.destination as! EditViewController).text = contentsList[(self.memoTableView.indexPathForSelectedRow)!.row].text
        }
    }
    
}


