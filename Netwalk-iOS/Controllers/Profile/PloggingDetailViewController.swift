//
//  PloggingDetailViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/12.
//

import UIKit
import GoogleMaps

class PloggingDetailViewController: UIViewController {

    @IBOutlet weak var ploggingDate: UILabel!
    
    @IBOutlet weak var ploggingMap: UIView!
    
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
    }
    
    
    private func setupMapView() {
        let camera = GMSCameraPosition(latitude: 36, longitude: 127.5, zoom: 18)
        
        mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 373, height: 300), camera: camera)
        ploggingMap.addSubview(mapView)
    }

    
}
