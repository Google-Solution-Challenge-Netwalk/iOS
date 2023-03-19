//
//  GroupCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupCapacity: UILabel!
    @IBOutlet weak var groupParticipant: UILabel!
    
    static let cellId = "GroupCollectionViewCell"
    static let className = "GroupCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure() {
//        titleLbl.text = "aaaaaaaaaaaaa"
//        imageView.tintColor = .blue
    }

}
