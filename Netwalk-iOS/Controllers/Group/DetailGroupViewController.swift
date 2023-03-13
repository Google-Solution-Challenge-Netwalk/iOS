//
//  DetailGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.register(UINib(nibName: DetailGroupTableViewCell.className, bundle: nil), forCellReuseIdentifier: DetailGroupTableViewCell.cellId)
    }

}

extension DetailGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailGroupTableViewCell.cellId, for: indexPath) as! DetailGroupTableViewCell
            cell.configure()
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
        case 0:
            return 600
        default:
            return 0
        }
        
    }
}
