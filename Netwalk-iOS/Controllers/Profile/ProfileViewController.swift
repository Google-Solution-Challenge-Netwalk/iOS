//
//  ProfileViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // 테이블 뷰 헤더 영역 사용하기
        tableView.register(UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileHeaderTableViewCell")
        
        tableView.register(UINib(nibName: "ProfileBodyTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileBodyTableViewCell")
        
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
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileBodyTableViewCell", for: indexPath) as! ProfileBodyTableViewCell
            
            cell.didSelectItem = { indexPath in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PloggingDetailViewController") as! PloggingDetailViewController
                
                self.present(vc, animated: true)
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // 수정 필요
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 350
        case 1:
            return 1500
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
