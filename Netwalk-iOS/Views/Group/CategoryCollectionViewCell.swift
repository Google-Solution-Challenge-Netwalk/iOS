//
//  CategoryCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with category: Category){
        self.categoryImage.image = UIImage(named: category.imageName)
        self.categoryTitle.text = category.title
    }

}
