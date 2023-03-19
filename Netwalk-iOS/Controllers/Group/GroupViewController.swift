//
//  GroupViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class MyGroupViewController: UIViewController {
    @IBOutlet weak var addGroupButton: UIButton!
    @IBOutlet weak var myGroupTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPartGroupList()
        addGroupButton.layer.cornerRadius = addGroupButton.layer.frame.size.width / 2
        setUpTableView()
    }
    
    func setUpTableView() {
        myGroupTable.delegate = self
        myGroupTable.dataSource = self
        myGroupTable.register(UINib(nibName: "MyGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "MyGroupTableViewCell") //nib 파일 등록
        
    }
    
    @IBAction func addGroupButtonTapped(_ sender: UIButton) {
        let newGroupVC = storyboard?.instantiateViewController(withIdentifier: "NewGroupVC") as! NewGroupViewController
        navigationController?.pushViewController(newGroupVC, animated: true)
    }
    
    func requestPartGroupList() {
        
        guard let user = UserDefaults.standard.getLoginUser() else { return }

        GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
            GroupManager.shared.groups = groups
            
//            print(groups)
            DispatchQueue.main.async {
                self.myGroupTable.reloadData()
            }
        }
    }
    
}

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupManager.shared.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var group: Group
        group = GroupManager.shared.groups[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupTableViewCell") as! MyGroupTableViewCell
        
        cell.selectionStyle = .none
        cell.myGroupTitle.text = group.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        return 90
        
        
        
    }
}
