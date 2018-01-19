//
//  ViewController.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    var contentsList = [[String: String]]()
    
    var testArray = ["23:20:12", "메모밤입니다."]
    let contents1 = ["contents" : "FC바르셀로나 시절, 국내 팬들 사이에서는 '메없산왕'이라는 표현이 유행했다."]
    let contents2 = ["contents" : "FC바르셀로나 시절, 국내 팬들 사이에서는 '메없산왕'이라는 표현이 유행했다. 메시가 없을 땐 산체스가 왕이라는 뜻의 이 은어는 산체스가 가진 역량을 단적으로 보여주는 표현이다. "]
    let contents3 = ["contents" : "FC바르셀로나 시절, 국내 팬들 사이에서는 '메없산왕'이라는 표현이 유행했다. 메시가 없을 땐 산체스가 왕이라는 뜻의 이 은어는 산체스가 가진 역량을 단적으로 보여주는 표현이다. 이른바 '신계' 다음 레벨의 공격수를 거론할 때 산체스는 빠짐없이 거론되던 이름이다. "]
    let contents4 = ["contents" : "FC바르셀로나 시절, 국내 팬들 사이에서는 '메없산왕'이라는 표현이 유행했다. 메시가 없을 땐 산체스가 왕이라는 뜻의 이 은어는 산체스가 가진 역량을 단적으로 보여주는 표현이다. 이른바 '신계' 다음 레벨의 공격수를 거론할 때 산체스는 빠짐없이 거론되던 이름이다. 바르셀로나 시절이나 아스널 시절에나, 산체스는 스스로 경기의 마침표를 찍을 줄 아는 파괴력을 보여줬다. 그러니, 뛰어난 개인 기술에 감독의 전술을 영리하게 이해하는 축구 지능까지 겸비한 산체스는 어떤 팀에서라도 제 몫을 하고도 남는 특급 플레이어임이 분명하다. "]
    let contents5 = ["contents" : "FC바르셀로나 시절, 국내 팬들 사이에서는 '메없산왕'이라는 표현이 유행했다. 메시가 없을 땐 산체스가 왕이라는 뜻의 이 은어는 산체스가 가진 역량을 단적으로 보여주는 표현이다. 이른바 '신계' 다음 레벨의 공격수를 거론할 때 산체스는 빠짐없이 거론되던 이름이다. 바르셀로나 시절이나 아스널 시절에나, 산체스는 스스로 경기의 마침표를 찍을 줄 아는 파괴력을 보여줬다. 그러니, 뛰어난 개인 기술에 감독의 전술을 영리하게 이해하는 축구 지능까지 겸비한 산체스는 어떤 팀에서라도 제 몫을 하고도 남는 특급 플레이어임이 분명하다. 데려올 수만 있다면 어떤 팀이든 환영할, 그리고 어떤 팀에서든 곧바로 주전으로 나설 수 있는 선수인 셈이다."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.isHidden = true
        
        contentsList = [contents1, contents2, contents3, contents4, contents5]
        
        print(NSHomeDirectory())
        
    }
    
    func addMemo(text: String , dueDate: Date) {
        let memo = Memo()
        memo.text = text
        memo.dueDate = dueDate
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(memo)
        }

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
        let dicTemp = contentsList[indexPath.row]
        
        let whiteCell = tableView.dequeueReusableCell(withIdentifier: "whiteCell", for: indexPath) as! WhiteTableViewCell
        whiteCell.contentsLabel.text = dicTemp["contents"]!
        return whiteCell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            (segue.destination as! EditViewController).memoData = contentsList[(self.memoTableView.indexPathForSelectedRow)!.row]
        }
    }
    
}
