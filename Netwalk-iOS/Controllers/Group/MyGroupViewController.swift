//
//  MyGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/20.
//

import UIKit

class MyGroupViewController: UIViewController {
    @IBOutlet weak var addGroupButton: UIButton!
    @IBOutlet weak var myGroupTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        requestPartGroupList()
        addGroupButton.layer.cornerRadius = addGroupButton.layer.frame.size.width / 2
        setUpTableView()
    }
    
    func setUpTableView() {
        myGroupTable.delegate = self
        myGroupTable.dataSource = self
        myGroupTable.register(UINib(nibName: "MyGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "MyGroupTableViewCell")
        
    }
    
    @IBAction func addGroupButtonTapped(_ sender: UIButton) {
        let newGroupVC = storyboard?.instantiateViewController(withIdentifier: "NewGroupVC") as! NewGroupViewController
        navigationController?.pushViewController(newGroupVC, animated: true)
    }
    
    func requestPartGroupList() {
        guard let user = UserDefaults.standard.getLoginUser() else { return }
        GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
            GroupManager.shared.groups = groups
            DispatchQueue.main.async {
                self.myGroupTable.reloadData()
            }
        }
    }
}

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailGroupVC = storyboard?.instantiateViewController(withIdentifier: "DetailGroupVC") as! DetailGroupViewController
        detailGroupVC.group = GroupManager.shared.groups[indexPath.row]
        detailGroupVC.flag = 0
        navigationController?.pushViewController(detailGroupVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupManager.shared.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = GroupManager.shared.groups[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupTableViewCell") as! MyGroupTableViewCell
        
        cell.selectionStyle = .none
        cell.myGroupImg.image = UIImage(named:"\(group.category).png")
        cell.myGroupTitle.text = group.name
        cell.groupParticipant.text = String(group.participant)
        cell.groupCapacity.text = String(group.capacity)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        return 90
        
    }
    
}
