//
//  HeaderCollectionReusableView.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/08.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var count: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
