//
//  DetailGroupCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import UIKit

class DetailGroupCollectionViewCell: UICollectionViewCell {

    static let cellId = "DetailGroupCollectionViewCell"
    static let className = "DetailGroupCollectionViewCell"
    
    
//    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userTime: UILabel!
    @IBOutlet weak var userKm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
