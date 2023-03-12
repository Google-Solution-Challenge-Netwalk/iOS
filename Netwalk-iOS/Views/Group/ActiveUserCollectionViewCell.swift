//
//  ActiveUserCollectionViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class ActiveUserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userTrashNumber: UILabel!
    @IBOutlet weak var userTrashBackground: UIImageView!
    @IBOutlet weak var userKm: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    public func configure(with activeUsers: ActiveUser){
        self.userProfileImage.image = UIImage(named: activeUsers.userProfileImage)
        self.userTrashNumber.text = activeUsers.userTrashNumber
        self.userTrashBackground.image = UIImage(named: activeUsers.userTrashBackground)
        self.userName.text = activeUsers.userName
        self.userKm.text = activeUsers.userKm
        self.userTime.text = activeUsers.userTime
    }

}
