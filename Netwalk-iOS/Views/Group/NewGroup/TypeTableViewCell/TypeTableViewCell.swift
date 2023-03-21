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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = [String]()
    
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

        switch target { // 타입별로 값을 설정
        case .overseas:
            cell.typeLabel.text = "Overseas"
            cell.typeImage.image = UIImage(named: "overseas.png")
        case .mountain:
            cell.typeLabel.text = "Mountain"
            cell.typeImage.image = UIImage(named: "mountain.png")
        case .sea:
            cell.typeLabel.text = "Sea"
            cell.typeImage.image = UIImage(named: "sea.png")
        case .dawn:
            cell.typeLabel.text = "Dawn"
            cell.typeImage.image = UIImage(named: "dawn.png")
        case .morning:
            cell.typeLabel.text = "Morning"
            cell.typeImage.image = UIImage(named: "morning.png")
        case .lunch:
            cell.typeLabel.text = "Lunch"
            cell.typeImage.image = UIImage(named: "lunch.png")
        case .evening:
            cell.typeLabel.text = "Evening"
            cell.typeImage.image = UIImage(named: "evening.png")
        case .night:
            cell.typeLabel.text = "Night"
            cell.typeImage.image = UIImage(named: "night.png")
        case .student:
            cell.typeLabel.text = "Student"
            cell.typeImage.image = UIImage(named: "student.png")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
}
