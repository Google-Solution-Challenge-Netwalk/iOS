//
//  ActivateGroupsViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/08.
//

import UIKit

class ActivateGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        requestPartGroupList()
        
        
    }
    

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90
        tableView.sectionHeaderHeight = 50
        
        tableView.register(UINib(nibName: "ActivateGroupHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ActivateGroupHeaderView")
        tableView.register(UINib(nibName: "MyGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "MyGroupTableViewCell")
    }
    
    func requestPartGroupList() {
        
        guard let user = UserDefaults.standard.getLoginUser() else { return }
        
        GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
            GroupManager.shared.groups = groups
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension ActivateGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ActivateGroupHeaderView") as! ActivateGroupHeaderView
        
        if section == 0 {
            view.title.text = "Activate Group"
        } else {
            view.title.text = "Inactivate Group"
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupManager.shared.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupTableViewCell") as! MyGroupTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    
}
