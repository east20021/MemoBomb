//
//  ExpiredMemoListViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 3. 5..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift

class ExpiredMemoListViewController: UIViewController {

    private var expiredMemoManager = ExpiredMemoManager()
    private var contentsList: Results<ExpiredMemo>!
    private var realm: Realm!
    private var token: NotificationToken!

    @IBOutlet weak var expiredMemoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setRealm()
    }
    
    func setRealm() {
        do {
            realm = try Realm()
        } catch {
            print("\(error)")
        }
        contentsList = expiredMemoManager.getMemos(type: ExpiredMemo.self)
    }
    
    func setNotificationRealmDB() {
        token = contentsList.observe { notification in
            self.expiredMemoTableView.reloadData()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ExpiredMemoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpiredMemoCell", for: indexPath) as! ExpiredMemoTableViewCell
        cell.expiredMemoLabel.text = contentsList[indexPath.row].text
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}
