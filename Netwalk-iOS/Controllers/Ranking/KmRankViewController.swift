//
//  KmRankViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import UIKit

class KmRankViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "KmRankTableViewCell", bundle: nil), forCellReuseIdentifier: "KmRankTableViewCell") //nib 파일 등록
        
    }
    
}

extension KmRankViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "KmRankTableViewCell") as! KmRankTableViewCell
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        return 80
        
    }
}
