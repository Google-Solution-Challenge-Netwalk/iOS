//
//  NewGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//

import UIKit

struct CategoryCVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellRows: CGFloat = 2
    private init() {}
}

class NewGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    var categorys = [Category]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("NewGroupTableViewCell")
        print(#function)
        
        setUpCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("NewGroupTableViewCell")
        print(#function)
        
        
    }
    
    func configure(with categorys: [Category]){
        self.categorys = categorys
        categoryCollectionView.reloadData()
    }
    
    func setUpCollectionView(){
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        flowLayout.scrollDirection = .horizontal
        
        let collectionCellHeight = 138 - CategoryCVCell.spacingWitdh * (CategoryCVCell.cellRows - 1) / CategoryCVCell.cellRows
        
        flowLayout.itemSize = CGSize(width: collectionCellHeight, height: collectionCellHeight)
        
        flowLayout.minimumInteritemSpacing = CategoryCVCell.spacingWitdh
        flowLayout.minimumLineSpacing = CategoryCVCell.spacingWitdh
        
        categoryCollectionView.collectionViewLayout = flowLayout
    }
}

extension NewGroupTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categorys[indexPath.row])
        return cell
    }
    
//    func collectionView(_ colletionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemA: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: 200)
//    }
    
}
