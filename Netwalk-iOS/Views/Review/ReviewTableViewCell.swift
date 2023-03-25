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
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var ploggingMap: UIView!
    @IBOutlet weak var totalHRS: UILabel!
    @IBOutlet weak var totalKM: UILabel!
    @IBOutlet weak var totalTrash: UILabel!
    
    
    var mapView: GMSMapView!
    var plogging: Activity? = nil
    
    let path = GMSMutablePath()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func setupUI() {
        guard let plogging = plogging else { return }
        username.text = plogging.name
        date.text = plogging.registDate
        
        let hrs = CustomDateFormatter.convertToString(plogging.totalActTime)
        totalHRS.text = "\(hrs) hrs"
        totalKM.text = "\(plogging.totalActDist) km"
        // totalTrash.text = 
        
        setupMapView()
        drawPolyline()
    }
    
    private func setupMapView() {
        guard let plogging = plogging else { return }
        let coor = plogging.coordinates[0]
        let camera = GMSCameraPosition(latitude: coor.lat, longitude: coor.log, zoom: 18)
        
        print(ploggingMap.frame)
        mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 373, height: 380), camera: camera)
        ploggingMap.addSubview(mapView)
    }
    
    private func drawPolyline() {
        guard let coordinates = plogging?.coordinates else { return }
        for coor in coordinates {
            path.add(CLLocationCoordinate2D(latitude: coor.lat, longitude: coor.log))
        }
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 5
        polyline.geodesic = true
        polyline.map = mapView
    }
    
}
