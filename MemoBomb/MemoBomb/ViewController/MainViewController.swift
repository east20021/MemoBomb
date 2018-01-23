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
    private var memoManager = MemoManager()
    
    
    private var dateArray = [Double]()
    private var timer = Timer()
    private var isTimerRunning = true
    private let setTime:Double = (24 * 60 * 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            realm = try Realm()
        } catch {
            print("\(error)")
        }
        
        contentsList = memoManager.getMemos(type: Memo.self)
        dateArray = setDateList()
        
        self.runtimer()
        
        token = contentsList.observe { notification in
            if self.contentsList.count == 0 {
                self.timer.invalidate()
                self.isTimerRunning = false
            } else {
                if self.isTimerRunning == false {
                    self.runtimer()
                    self.isTimerRunning = true
                }
            }
            self.memoTableView.reloadData()
        }
        
        print(NSHomeDirectory())
        
    }
    
    //set timer
    func runtimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        dateArray = setDateList()
        NotificationCenter.default.post(name: .timer, object: nil)
    }
    
    func timeDiff(memo: Memo) -> Double {
        let date = memoManager.getDate(memo: memo)
        let currentDate = Date()
        let diffseconds = currentDate.timeIntervalSince(date)
        return diffseconds
    }
    
    //메모 삭제 시간 설정
    func setDateList() -> [Double] {
        var array = [Double]()
        for i in contentsList {
            if timeDiff(memo: i) > setTime {
                memoManager.deleteMemo(memo: i)
            } else {
                array.append(timeDiff(memo: i))
            }
        }
        return array
    }
    
    

}

//테이블뷰 관련
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
    
    //segue를 이용하여 EditVC에 id값 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            (segue.destination as! EditViewController).id = contentsList[(self.memoTableView.indexPathForSelectedRow)!.row].id
        }
    }
    
}


