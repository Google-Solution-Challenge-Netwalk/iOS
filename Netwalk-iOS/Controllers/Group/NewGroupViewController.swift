//
//  ViewController.swift
//  CollectionViewinTableView
//
//  Created by jh on 2022/01/02.
//

import UIKit

class NewGroupViewController: UIViewController {
    
    @IBOutlet weak var addGroupButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewGroup("")
        self.navigationController?.isNavigationBarHidden = true
        tableView.register(UINib(nibName: TypeTableViewCell.className, bundle: nil), forCellReuseIdentifier: TypeTableViewCell.cellId)
        tableView.register(UINib(nibName: GroupTableViewCell.className, bundle: nil), forCellReuseIdentifier: GroupTableViewCell.cellId)
        addGroupButton.layer.cornerRadius = addGroupButton.layer.frame.size.width / 2
        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addGroupButtonTapped(_ sender: UIButton) {
        let createGroupVC = storyboard?.instantiateViewController(withIdentifier: "CreateGroupVC") as! CreateGroupViewController
        navigationController?.pushViewController(createGroupVC, animated: true)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let detailGroupVC = storyboard?.instantiateViewController(withIdentifier: "DetailGroupVC") as! DetailGroupViewController
        navigationController?.pushViewController(detailGroupVC, animated: true)
    }
    
    func requestNewGroup(_ category: String) {
        GroupNetManager.shared.readCategoryGroup(category) { groups in
            self.groups = groups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TypeTableViewCell.cellId, for: indexPath) as! TypeTableViewCell
                        cell.configure()
            cell.didSelectRow = { data in
                GroupNetManager.shared.readCategoryGroup(data) { groups in
                    print(groups)
                    self.groups = groups
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.cellId, for: indexPath) as! GroupTableViewCell
            cell.groups = groups
            cell.collectionView.reloadData()
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
        case 0:
            return 170
        case 1:
            return 500
        default:
            return 0
        }
    }
}
