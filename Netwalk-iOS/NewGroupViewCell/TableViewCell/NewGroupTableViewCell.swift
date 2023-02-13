//
//  NewGroupTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//

import UIKit

class NewGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryTitle: UILabel!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    var categorys = [Category]()
    
    func configure(with categorys: [Category]){
        self.categorys = categorys
        CategoryCollectionView.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        CategoryCollectionView.delegate = self
        CategoryCollectionView.dataSource = self
        CategoryCollectionView.register(UINib(nibName:"CategoryCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
    
    func collectionView(_ colletionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemA: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
