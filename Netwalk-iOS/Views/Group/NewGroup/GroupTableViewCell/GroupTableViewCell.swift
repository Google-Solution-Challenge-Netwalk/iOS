//
//  GroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let cellId = "GroupTableViewCell"
    static let className = "GroupTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UINib(nibName: GroupCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier : GroupCollectionViewCell.cellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GroupTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.cellId, for: indexPath) as! GroupCollectionViewCell
        cell.configure()
        //        cell.configure(with: model[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.cellId, for: indexPath) as! GroupCollectionViewCell
//        
//        cell.layer.cornerRadius = 10
//        cell.layer.masksToBounds = true
        return CGSize(width: width , height: 80)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
