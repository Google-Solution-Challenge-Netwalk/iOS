//
//  DetailGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitle: UILabel!
    var group: Group!
    var users : [GroupUser] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        requestGroupUsers(group.groupNo)
        tableView.register(UINib(nibName: DetailGroupTableViewCell.className, bundle: nil), forCellReuseIdentifier: DetailGroupTableViewCell.cellId)
    }
    
    func requestGroupUsers(_ grouoNo : Int) {
        
        UserNetManager.shared.readGroupUsers(grouoNo){ users in
            self.users = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension DetailGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailGroupTableViewCell.cellId, for: indexPath) as! DetailGroupTableViewCell
            
            groupTitle.text = group.name
            cell.groupCategory.text = group.category
            cell.groupParticipant.text = String(users.count)
            cell.groupCapacity.text = String(group.capacity)
            cell.users = self.users
            
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
