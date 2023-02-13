//
//  GroupViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class MyGroupViewController: UIViewController {
    @IBOutlet weak var myGroupTable: UITableView!
    @IBOutlet weak var addGroupButton: UIButton!
    
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        addGroupButton.layer.cornerRadius = addGroupButton.layer.frame.size.width / 2
        self.navigationItem.backButtonTitle = "Zedd"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
            cell.selectionStyle = .none
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell") as! myGroupTableViewCell
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
        case 2:
            return 90
        case 3:
            return 90
        case 4:
            return 90
        case 5:
            return 90
        case 6:
            return 90
        case 7:
            return 90
        case 8:
            return 90
            
        default:
            return 0
        }
    
  
    
    }
}
