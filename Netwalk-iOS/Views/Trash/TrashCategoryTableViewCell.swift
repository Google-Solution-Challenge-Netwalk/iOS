//
//  TrashCategoryTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/07.
//

import UIKit

class TrashCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var plastic: UIButton!
    @IBOutlet weak var can: UIButton!
    @IBOutlet weak var glass: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var vinyl: UIButton!
    @IBOutlet weak var others: UIButton!
    
    var images: [Trash] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
        setupTrashCount()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        plastic.layer.cornerRadius = 5
        plastic.layer.borderWidth = 1
        plastic.layer.borderColor = UIColor.lightGray.cgColor
        can.layer.cornerRadius = 5
        can.layer.borderWidth = 1
        can.layer.borderColor = UIColor.lightGray.cgColor
        glass.layer.cornerRadius = 5
        glass.layer.borderWidth = 1
        glass.layer.borderColor = UIColor.lightGray.cgColor
        paper.layer.cornerRadius = 5
        paper.layer.borderWidth = 1
        paper.layer.borderColor = UIColor.lightGray.cgColor
        vinyl.layer.cornerRadius = 5
        vinyl.layer.borderWidth = 1
        vinyl.layer.borderColor = UIColor.lightGray.cgColor
        others.layer.cornerRadius = 5
        others.layer.borderWidth = 1
        others.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func setupTrashCount() {
        let plasticCnt = getCategoryCount(TrashCategory.plastic.rawValue)
        let canCnt = getCategoryCount(TrashCategory.can.rawValue)
        let glassCnt = getCategoryCount(TrashCategory.glass.rawValue)
        let paperCnt = getCategoryCount(TrashCategory.paper.rawValue)
        let vinylCnt = getCategoryCount(TrashCategory.box.rawValue)
        let othersCnt = getCategoryCount(TrashCategory.others.rawValue)
        
        plastic.setTitle("Plastic (\(plasticCnt))", for: .normal)
        can.setTitle("Can (\(canCnt))", for: .normal)
        glass.setTitle("Glass (\(glassCnt))", for: .normal)
        paper.setTitle("Paper (\(paperCnt))", for: .normal)
        vinyl.setTitle("Vinyl (\(vinylCnt))", for: .normal)
        others.setTitle("Others (\(othersCnt))", for: .normal)
    }
    
    
    func getCategoryCount(_ category: String) -> Int {
        return images.filter { trash in
            trash.category == category
        }.count
    }
    
}
