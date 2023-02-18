//
//  TrashPhotoCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/07.
//

import UIKit

class TrashPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }

    func setupUI() {
        photo.layer.cornerRadius = 5
    }
}
