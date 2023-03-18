//
//  ProfileBodyTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/08.
//

import UIKit

class ProfileBodyTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var didSelectItem: ((_ indexPath: IndexPath)->())? = nil
    
    var ploggingRecords: [Activity] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
        requestPloggingRecords()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProfileBodyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileBodyCollectionViewCell")
        
        // 스크롤 방향
        flowLayout.scrollDirection = .vertical
        
        // UIScreen.main.bounds.width = 스크린 가로 사이즈
        // CVCell.spacingWidth * (CVCell.cellColumns - 1) = 셀 사이의 spacing 공간 개수
        let collectionCellWidth = (UIScreen.main.bounds.width - PhotoCVCell.spacingWitdh * (PhotoCVCell.cellColumns - 1)) / PhotoCVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = PhotoCVCell.spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = PhotoCVCell.spacingWitdh
        
        // 컬렉션뷰 속성에 flowLayout 할당
        collectionView.collectionViewLayout = flowLayout
    }
    
    private func requestPloggingRecords() {
        let user = UserDefaults.standard.getLoginUser()!
        
        PloggingNetManager.shared.getPloggingRecord(user) { activities in
            self.ploggingRecords = activities
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension ProfileBodyTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ploggingRecords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileBodyCollectionViewCell", for: indexPath) as! ProfileBodyCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("클릭 \(indexPath.item)")
        didSelectItem?(indexPath)
    }
    
    
}
