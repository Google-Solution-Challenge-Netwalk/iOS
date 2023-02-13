//
//  CategoryCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CategoryTitle: UILabel!
    @IBOutlet weak var CategoryImage: UIImageView!
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with category: Category){
        self.CategoryImage.image = UIImage(named:category.imageName)
        self.CategoryTitle.text = category.title
    }

}
