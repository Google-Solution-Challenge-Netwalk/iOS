//
//  TypeCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import UIKit


class TypeCollectionViewCell: UICollectionViewCell {

    static let cellId = "TypeCollectionViewCell"
    static let className = "TypeCollectionViewCell"
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // data model 넣으면 됨
    public func configure() {
        let image = UIImage(named: "overseas.png")
        typeLabel.text = "overseas"
        typeImage.image = image
    }

}
