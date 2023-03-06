//
//  ReviewTableViewCell.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/06.
//

import UIKit
import GoogleMaps

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var ploggingMapView: UIView!
    
    var mapView: GMSMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupMapView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupMapView() {
        let camera = GMSCameraPosition(latitude: 36, longitude: 127.5, zoom: 18)
        
        mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 373, height: 240), camera: camera)
        mapView.delegate = self
        
        ploggingMapView.addSubview(mapView)
    }
}

extension ReviewTableViewCell: GMSMapViewDelegate {
    
}
