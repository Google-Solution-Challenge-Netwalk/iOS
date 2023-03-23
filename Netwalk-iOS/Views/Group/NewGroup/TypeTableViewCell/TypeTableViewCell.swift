//
//  TypeTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import UIKit

class TypeTableViewCell: UITableViewCell {
    
    static let cellId = "TypeTableViewCell"
    static let className = "TypeTableViewCell"
    let groupTableVC = GroupTableViewCell()
    var didSelectRow: ((_ data: String) -> Void)? = nil

    @IBOutlet weak var collectionView: UICollectionView!
    
    func configure(){
        //        with model: [Model]
        //        self.model = models
        collectionView.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: TypeCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier : TypeCollectionViewCell.cellId)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


extension TypeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let target = Category.allCases[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCollectionViewCell.cellId, for: indexPath) as! TypeCollectionViewCell
        let category = Category.allCases[indexPath.item]
        
        cell.typeLabel.text = category.rawValue
        cell.typeImage.image = UIImage(named: "\(category.rawValue).png")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = Category.allCases[indexPath.item]
        didSelectRow?(category.rawValue)
    }
    
}
