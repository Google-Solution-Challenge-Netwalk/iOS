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
    
    var groups: [Group] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        requestNewGroup()
        // Initialization code
        
        collectionView.register(UINib(nibName: GroupCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier : GroupCollectionViewCell.cellId)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func requestNewGroup() {
        let category = Category.sea
        
        GroupNetManager.shared.readCategoryGroup(category) { groups in
            self.groups = groups
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension GroupTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GroupManager.shared.groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCollectionViewCell", for: indexPath) as! GroupCollectionViewCell
//
//        let group = groups[indexPath.item]
//
//        cell.groupTitle.text = group.name
//        cell.groupParticipant.text = String(group.participant)
//        cell.groupCapacity.text = String(group.capacity)

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.cellId, for: indexPath) as! GroupCollectionViewCell
//        
//        cell.layer.cornerRadius = 10
//        cell.layer.masksToBounds = true
        return CGSize(width: 370, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
