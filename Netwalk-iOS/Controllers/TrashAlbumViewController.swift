//
//  TrashAlbumViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/07.
//

import UIKit

class TrashAlbumViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName:"TrashCategoryTableViewCell", bundle: nil), forCellReuseIdentifier:"TrashCategoryTableViewCell")
        tableView.register(UINib(nibName:"TrashPhotoTableViewCell", bundle: nil), forCellReuseIdentifier:"TrashPhotoTableViewCell")
    }

}

extension TrashAlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrashCategoryTableViewCell", for: indexPath) as! TrashCategoryTableViewCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrashPhotoTableViewCell", for: indexPath) as! TrashPhotoTableViewCell
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 110
        case 1:
            return tableView.frame.height - 120
        default:
            return 0
        }
        
    }
}
