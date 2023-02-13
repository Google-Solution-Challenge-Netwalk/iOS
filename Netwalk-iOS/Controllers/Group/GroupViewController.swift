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
        addGroupButton.layer.cornerRadius = addGroupButton.layer.frame.size.width / 2
        super.viewDidLoad()
        setUpTableView()
        
        
        // Do any additional setup after loading the view.
        }
    func setUpTableView() {
        myGroupTable.delegate = self
        myGroupTable.dataSource = self
        myGroupTable.register(UINib(nibName: "myGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "myGroupTableViewCell") //nib 파일 등록
        
       }
    
    @IBAction func addGroupButtonTapped(_ sender: UIButton) {
        let newGroupVC = storyboard?.instantiateViewController(withIdentifier: "NewGroupVC") as! NewGroupViewController
                navigationController?.pushViewController(newGroupVC, animated: true)
    }
    
}
    
extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! MyGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! MyGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        switch indexPath.row {
        case 0:
            return 90
        case 1:
            return 90
            
        default:
            return 0
        }
    
  
    
    }
}
