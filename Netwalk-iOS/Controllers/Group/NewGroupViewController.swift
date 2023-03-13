//
//  ViewController.swift
//  CollectionViewinTableView
//
//  Created by jh on 2022/01/02.
//

import UIKit

class NewGroupViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.register(UINib(nibName: TypeTableViewCell.className, bundle: nil), forCellReuseIdentifier: TypeTableViewCell.cellId)
        
//        tableView.register(UINib(nibName: Collection2TableViewCell.className, bundle: nil), forCellReuseIdentifier: Collection2TableViewCell.cellId)
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
            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: Collection2TableViewCell.cellId, for: indexPath) as! Collection2TableViewCell
////            cell.configure()
//            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let interval:CGFloat = 3
//        let width: CGFloat = ( UIScreen.main.bounds.width - interval * 3 ) / 2
        
        switch indexPath.row{
        case 0:
            return 200
//        case 1:
//            return (width + 40 + 3) * 5 + 40
        default:
            return 0
        }
        
        
    }
}
