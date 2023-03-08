//
//  ReviewTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/08.
//

import UIKit
import GoogleMaps

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var ploggingMap: UIView!
    
    var mapView: GMSMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupMapView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func setupMapView() {
        let camera = GMSCameraPosition(latitude: 36, longitude: 127.5, zoom: 18)
        
        mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 373, height: 240), camera: camera)
        ploggingMap.addSubview(mapView)
    }
    
}
