//
//  DetailGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import UIKit

class DetailGroupTableViewCell: UITableViewCell {
    
    static let cellId = "DetailGroupTableViewCell"
    static let className = "DetailGroupTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = [String]()
    
    func configure(){
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: DetailGroupCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier : DetailGroupCollectionViewCell.cellId)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailGroupTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailGroupCollectionViewCell.cellId, for: indexPath) as! DetailGroupCollectionViewCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 160)
    }
}
