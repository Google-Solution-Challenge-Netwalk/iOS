//
//  ReviewViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ploggingRecords: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        requestUsersPloggingRecords()
    }
    

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        tableView.rowHeight = 500
    }

    func requestUsersPloggingRecords() {
        PloggingNetManager.shared.getUsersPloggingRecord { activities in
            self.ploggingRecords = activities
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ploggingRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        
        cell.plogging = ploggingRecords[indexPath.row]
        
        cell.setupUI()
        
        return cell
    }
    
    
}
