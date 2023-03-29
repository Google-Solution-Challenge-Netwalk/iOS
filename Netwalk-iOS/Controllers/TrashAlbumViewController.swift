//
//  TrashAlbumViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/07.
//

import UIKit

class TrashAlbumViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var images: [Trash] = []
    var actNo: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        requestTrashImage()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName:"TrashCategoryTableViewCell", bundle: nil), forCellReuseIdentifier:"TrashCategoryTableViewCell")
        tableView.register(UINib(nibName:"TrashPhotoTableViewCell", bundle: nil), forCellReuseIdentifier:"TrashPhotoTableViewCell")
    }
    
    func requestTrashImage() {
        
        TrashNetManager.shared.getTrashImages(actNo) { images in
            self.images = images
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension TrashAlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TrashCategoryTableViewCell", for: indexPath) as! TrashCategoryTableViewCell
//            cell.images = images
//            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TrashPhotoTableViewCell", for: indexPath) as! TrashPhotoTableViewCell
//            cell.images = images
//            cell.collectionView.reloadData()
//            return cell
//        default:
//            return UITableViewCell()
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrashPhotoTableViewCell", for: indexPath) as! TrashPhotoTableViewCell
        cell.images = images
        //cell.collectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {
//        case 0:
//            return 110
//        case 1:
//            return tableView.frame.height - 120
//        default:
//            return 0
//        }
            
        return tableView.frame.height
    }
}
