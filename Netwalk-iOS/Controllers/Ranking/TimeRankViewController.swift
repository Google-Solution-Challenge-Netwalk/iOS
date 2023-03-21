//
//  TimeRankViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import UIKit

class TimeRankViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView() {
        reqeustUserRank("time")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TimeRankTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeRankTableViewCell") //nib 파일 등록
        
    }
    
    func reqeustUserRank(_ type: String) {
        
        RankingNetManager.shared.ranking(type) { rankings in
            RankingManager.shared.rankings = rankings
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
}

extension TimeRankViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return RankingManager.shared.rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        var ranking: Ranking
        ranking = RankingManager.shared.rankings[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeRankTableViewCell") as! TimeRankTableViewCell

        cell.selectionStyle = .none
        cell.rankName.text = ranking.userName
        cell.rankNumber.text = String((indexPath.row)+1)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        return 80
        
    }
}
