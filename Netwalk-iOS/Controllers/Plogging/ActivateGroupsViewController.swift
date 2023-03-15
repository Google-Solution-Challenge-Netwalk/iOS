//
//  ActivateGroupsViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/08.
//

import UIKit

class ActivateGroupsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        requestPartGroupList()
    }
    

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 헤더 등록
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        // 셀 등록
        collectionView.register(UINib(nibName:"BodyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"BodyCollectionViewCell")
    }
    
    func requestPartGroupList() {
        
        guard let user = UserDefaults.standard.getLoginUser() else { return }
        
        GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
            GroupManager.shared.groups = groups
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}


extension ActivateGroupsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 섹션 당 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            // 활성화 그룹 개수
            return 1
        case 1:
            // 비활성화 그룹 개수
            return GroupManager.shared.groups.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCollectionViewCell", for: indexPath) as! BodyCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.statusColor.backgroundColor = .systemGreen
        case 1:
            cell.statusColor.backgroundColor = .lightGray
        default:
            break
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        if indexPath.section == 0 { // 활성화 그룹
            header.title.text = "활성화 그룹"
        } else { // 비활성화 그룹
            header.title.text = "비활성화 그룹"
        }
        
        return header
    }
    
    // 섹션 헤더 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    // 셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 130)
    }
    
    // 섹션 인셋
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//    }
    
    // 행 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.width * 0.062
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
