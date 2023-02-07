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
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
