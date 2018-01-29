//
//  ViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift


class MainViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    private var realm: Realm!
    private var contentsList: Results<Memo>!
    private var token: NotificationToken!
    
    private let memoManager = MemoManager()
    private let timeManager = TimeManager()
    
    private var dateArray = [Double]()
    private var timer = Timer()
    private var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setRealm()
        self.setDateArray()
        self.setTimer()
        self.setNotificationRealmDB()
        //realmDB 디렉토리 위치
        
        print(NSHomeDirectory())
    }
    
    func setRealm() {
        do {
            realm = try Realm()
        } catch {
            print("\(error)")
        }
        contentsList = memoManager.getMemos(type: Memo.self)
    }
    
    func setDateArray() {
        dateArray = setDateList()
    }
    
    //메모 삭제 시간 설정
    func setDateList() -> [Double] {
        var array = [Double]()
        for memo in contentsList {
            if isDeleteMemo(memo: memo) {
                memoManager.deleteMemo(memo: memo)
            } else {
                array.append(timeManager.timeDiff(memo: memo))
            }
        }
        return array
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        self.isTimerRunning = true
    }
    
    @objc func updateTimer() {
        setDateArray()
        NotificationCenter.default.post(name: .timer, object: nil)
    }
    
    func isDeleteMemo(memo: Memo ) -> Bool{
        return timeManager.remainSeconds(memo: memo) < 1
    }
    
    func setNotificationRealmDB() {
        
        token = contentsList.observe { notification in
            
            if self.isContentsListEmpty() {
                self.invalidateTimer()
            } else {
                self.setTimer()
            }
            self.memoTableView.reloadData()
        }
    }
    
    func isContentsListEmpty() -> Bool {
        return self.contentsList.count < 1
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.isTimerRunning = false
    }
}

//테이블뷰
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let whiteCell = tableView.dequeueReusableCell(withIdentifier: "whiteCell", for: indexPath) as! WhiteTableViewCell
        whiteCell.contentsLabel.text = contentsList[indexPath.row].text
        whiteCell.dateLabel.text = memoManager.getDateString(memo: contentsList[indexPath.row])
        return whiteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memoManager.deleteMemo(memo: contentsList[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    //segue를 이용하여 EditVC에 id값 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            (segue.destination as! EditViewController).id = contentsList[(self.memoTableView.indexPathForSelectedRow)!.row].id
        }
    }
}


