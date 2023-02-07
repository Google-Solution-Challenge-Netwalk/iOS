//
//  TrashPhotoTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/07.
//

import UIKit

struct CVCell {
    static let spacingWitdh: CGFloat = 0
    static let cellColumns: CGFloat = 4
    private init() {}
}

class TrashPhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName:"TrashPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"TrashPhotoCollectionViewCell")
        
        // 스크롤 방향
        flowLayout.scrollDirection = .vertical
        
        // UIScreen.main.bounds.width = 스크린 가로 사이즈
        // CVCell.spacingWidth * (CVCell.cellColumns - 1) = 셀 사이의 spacing 공간 개수
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWitdh * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: 200)
        
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = CVCell.spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = CVCell.spacingWitdh
        
        // 컬렉션뷰 속성에 flowLayout 할당
        collectionView.collectionViewLayout = flowLayout
    }
    
    
}

extension TrashPhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 29
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrashPhotoCollectionViewCell", for: indexPath) as! TrashPhotoCollectionViewCell
        
        return cell
    }
    
    
}
