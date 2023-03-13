//
//  DetailGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupTableViewCell: UITableViewCell {
    @IBOutlet weak var groupCategory: UILabel!
    @IBOutlet weak var groupInfoView: UIView!
    @IBOutlet weak var groupNumofPeople: UILabel!
    @IBOutlet weak var activeUserCollectionView: UICollectionView!
    @IBOutlet weak var groupAverageDist: UILabel!
    @IBOutlet weak var groupAverageTime: UILabel!
    static func nib() -> UINib {
        return UINib(nibName: "ActiveUserCollectionView", bundle: nil)
    }
    
    var activeUsers = [ActiveUser]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("DetailGroupTableViewCell")
        print(#function)
        
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        groupInfoView.layer.cornerRadius = 10
        groupInfoView.layer.borderWidth = 1
        groupInfoView.layer.borderColor = UIColor.darkGray.cgColor
        
        print("DetailGroupTableViewCell")
        print(#function)
    }
    
    func configure(with activeUsers: [ActiveUser]){
        self.activeUsers = activeUsers
        activeUserCollectionView.reloadData()
    }
    
    func setUpCollectionView(){
        activeUserCollectionView.dataSource = self
        activeUserCollectionView.delegate = self
        
        activeUserCollectionView.register(UINib(nibName: "ActiveUserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ActiveUserCollectionViewCell")
        
    }
}

extension DetailGroupTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        activeUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveUserCollectionViewCell", for: indexPath) as! ActiveUserCollectionViewCell
        cell.configure(with: activeUsers[indexPath.row])
        return cell
    }
    
}
