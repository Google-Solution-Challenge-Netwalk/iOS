//
//  DetailGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupTableViewCell: UITableViewCell {
    
    static let cellId = "DetailGroupTableViewCell"
    static let className = "DetailGroupTableViewCell"
    
    
    @IBOutlet weak var groupCapacity: UILabel!
    @IBOutlet weak var groupParticipant: UILabel!
    @IBOutlet weak var groupCategory: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var didSelectItem: ((_ indexPath: IndexPath)->())? = nil
    var users: [GroupUser]!
    
    func configure(){
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: DetailGroupCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier : DetailGroupCollectionViewCell.cellId)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

extension DetailGroupTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailGroupCollectionViewCell.cellId, for: indexPath) as! DetailGroupCollectionViewCell
        let user = users[indexPath.item]
        cell.userName.text = user.name
        cell.userTime.text = String("\(CustomDateFormatter.convertToString(Int(user.total_act_time!)))")
        cell.userKm.text = String("\(user.total_act_distance!) km")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 160)
    }
}
