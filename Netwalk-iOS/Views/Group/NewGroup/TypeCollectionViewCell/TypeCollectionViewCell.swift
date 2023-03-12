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
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // data model 넣으면 됨
    public func configure() {
        myLabel.text = "123421321321"
        myImageView.tintColor = .blue
    }

}
