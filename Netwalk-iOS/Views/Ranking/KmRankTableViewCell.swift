//
//  KmRankTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/16.
//

import UIKit

class KmRankTableViewCell: UITableViewCell {

    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var rankNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView() {
        rankNumber.layer.cornerRadius = 25
        rankNumber.layer.borderWidth = 3
        rankNumber.layer.borderColor = UIColor.black.cgColor
    }
    
}
