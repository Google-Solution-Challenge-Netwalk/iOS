//
//  DetailGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupViewController: UIViewController {
    
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitle: UILabel!
    var group: Group!
    var users : [GroupUser] = []
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        if flag == 0 {
            joinButton.isHidden = true
        }
        else {
            joinButton.isHidden = false
        }
        requestGroupUsers(group.groupNo)
        tableView.register(UINib(nibName: DetailGroupTableViewCell.className, bundle: nil), forCellReuseIdentifier: DetailGroupTableViewCell.cellId)
    }
    
    @IBAction func joinButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Join a group?", message: "\(group.name)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default) { _ in
            let user = UserDefaults.standard.getLoginUser()!
            let joinUser = Join(userNo: user.user_no!, groupNo: self.group.groupNo)
            self.requestJoinGroup(joinUser)
        }
        
        let cancel = UIAlertAction(title: "No", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
    
    func requestGroupUsers(_ grouoNo : Int) {
        
        UserNetManager.shared.readGroupUsers(grouoNo){ users in
            self.users = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func requestJoinGroup(_ joinUser:Join){
        UserNetManager.shared.joinGroup(joinUser) {
            DispatchQueue.main.async {
                guard let viewControllerStack =
                        self.navigationController?.viewControllers else { return }
                for viewController in viewControllerStack {
                    if let myGroupView = viewController as? MyGroupViewController {
                        myGroupView.requestPartGroupList()
                        myGroupView.myGroupTable.reloadData()
                        self.navigationController?.popToViewController(myGroupView, animated: true)
                    }
                }
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
