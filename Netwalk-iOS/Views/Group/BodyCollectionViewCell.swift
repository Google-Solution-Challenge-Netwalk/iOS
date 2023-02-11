//
//  BodyCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/08.
//

import UIKit

class BodyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var personnel: UILabel!
    @IBOutlet weak var statusColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }
    
    func setupUI() {
        containerView.layer.cornerRadius = 5
        subView.layer.cornerRadius = 5
        image.layer.cornerRadius = 5
        statusColor.layer.cornerRadius = statusColor.frame.width / 2
        
        containerView.layer.borderWidth = 1
    }

}
