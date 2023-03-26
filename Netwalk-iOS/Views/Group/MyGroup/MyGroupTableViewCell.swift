//
//  myGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//

import UIKit

class MyGroupTableViewCell: UITableViewCell {
    @IBOutlet weak var myGroupImg: UIImageView!
    @IBOutlet weak var myGroupTitle: UILabel!
    @IBOutlet weak var groupCapacity: UILabel!
    @IBOutlet weak var groupParticipant: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
