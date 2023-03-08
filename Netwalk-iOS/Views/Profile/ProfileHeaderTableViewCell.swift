//
//  ProfileHeaderTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/08.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var ploggingInfoView: UIView!
    
    @IBOutlet weak var ploggingCount: UILabel!
    @IBOutlet weak var totalTrash: UILabel!
    @IBOutlet weak var totalDistance: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
        ploggingInfoView.layer.cornerRadius = 10
        ploggingInfoView.layer.borderColor = UIColor.systemGray3.cgColor
        ploggingInfoView.layer.borderWidth = 1
    }
    
}
