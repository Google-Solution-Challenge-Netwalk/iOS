//
//  DetailGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupViewController: UIViewController {
    
    @IBOutlet weak var detailGroupTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var activeUsers = [ActiveUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpTableView()

    }
    
    func setUpTableView(){
        print("DetailGroupViewController")
        print(#function)
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        activeUsers.append(ActiveUser(userProfileImage: "overseas", userTrashNumber: "73", userTrashBackground: "button_compass_night", userName: "Weploplo", userTime: "3:25:36", userKm: "5.21km"))
        detailGroupTableView.delegate = self
        detailGroupTableView.dataSource = self
        detailGroupTableView.register(UINib(nibName:"DetailGroupTableViewCell", bundle:nil), forCellReuseIdentifier: "DetailGroupTableViewCell")
        detailGroupTableView.separatorStyle = .none
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
}
extension DetailGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("DetailGroupViewController")
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailGroupTableViewCell", for: indexPath) as! DetailGroupTableViewCell
        
        cell.groupCategory.text = "Overseas • Night"
        cell.groupNumofPeople.text = "the number of persons 9/10"
        cell.groupAverageTime.text = "average distance 3.84 km"
        cell.groupAverageDist.text = "average time 32 : 63 : 12"
        cell.configure(with: activeUsers)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
}
