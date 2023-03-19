//
//  ProfileBodyCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/09.
//

import UIKit

class ProfileBodyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var ploggingDate: UILabel!
    
    @IBOutlet weak var totalKM: UILabel!
    
    @IBOutlet weak var totalHRS: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
    }

}
