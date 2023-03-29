//
//  ProfileViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ploggingRecords: [Activity] = []
    var userPlogData: UserPlogData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        //requestPloggingRecords()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        requestPloggingRecords()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // 테이블 뷰 헤더 영역 사용하기
        tableView.register(UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileHeaderTableViewCell")
        
        tableView.register(UINib(nibName: "ProfileBodyTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileBodyTableViewCell")
        
    }
    
    private func requestPloggingRecords() {
        let user = UserDefaults.standard.getLoginUser()!
      
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        PloggingNetManager.shared.getPloggingRecord(user) { activities in
            self.ploggingRecords = activities.reversed()
            //self.ploggingRecords.reverse()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        UserNetManager.shared.getUserPlogData(user.user_no!) { data in
            self.userPlogData = data
            self.userPlogData!.totalActDist = round(self.userPlogData!.totalActDist * 100) / 100
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }

    
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let signOut = UIAlertAction(title: "Sign Out", style: .default) { _ in
            
            UserDefaults.standard.unsetLoginUser()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(identifier: "LoginVC")
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginVC)
        }
        
        let withdrawal = UIAlertAction(title: "Withdrawal", style: .default) { _ in
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        withdrawal.setValue(UIColor.red, forKey: "titleTextColor")
        
        sheet.addAction(signOut)
        sheet.addAction(withdrawal)
        sheet.addAction(cancel)
        
        present(sheet, animated: true)
        
    }
    
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableViewCell", for: indexPath) as! ProfileHeaderTableViewCell
            
            let hrs = CustomDateFormatter.convertToString(userPlogData?.totalActTime ?? 0)
            cell.totalTime.text = hrs
            cell.ploggingCount.text = "\(userPlogData?.actCnt ?? 0)"
            cell.totalDistance.text = "\(userPlogData?.totalActDist ?? 0)"
            cell.totalTrash.text = "\(userPlogData?.totalActTrash ?? 0)"
            cell.username.text = UserDefaults.standard.getLoginUser()?.name
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileBodyTableViewCell", for: indexPath) as! ProfileBodyTableViewCell
            
            cell.ploggingRecords = ploggingRecords
            cell.didSelectItem = { indexPath in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PloggingDetailViewController") as! PloggingDetailViewController
                vc.plogging = self.ploggingRecords[indexPath.item]
                self.present(vc, animated: true)
            }
            cell.collectionView.reloadData()
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // 수정 필요
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return tableView.bounds.height - 300
        default:
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 350
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
}
