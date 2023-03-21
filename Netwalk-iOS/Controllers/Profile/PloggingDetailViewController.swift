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
    
    @IBOutlet weak var totalKM: UILabel!
    
    @IBOutlet weak var totalHRS: UILabel!
    
    @IBOutlet weak var sharedSwitch: UISwitch!
    
    var mapView: GMSMapView!
    var plogging: Activity!
    
    let path = GMSMutablePath()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        setupUI()
    }
    
    
    private func setupMapView() {
        let coor = plogging.coordinates[0]
        let camera = GMSCameraPosition(latitude: coor.lat, longitude: coor.log, zoom: 18)
        
        //mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 373, height: 400), camera: camera)
        mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: ploggingMap.frame.width, height: ploggingMap.frame.height), camera: camera)
        ploggingMap.addSubview(mapView)
    
    }
    
    private func setupUI() {
        ploggingDate.text = plogging.registDate
        totalKM.text = "\(plogging.totalActDist) KM"
        totalHRS.text = "\(CustomDateFormatter.convertToString(plogging.totalActTime)) HRS"
        sharedSwitch.setOn((plogging.shareState != 0), animated: false)
        drawPolyline()
    }
    
    private func drawPolyline() {
        
        for coor in plogging.coordinates {
            path.add(CLLocationCoordinate2D(latitude: coor.lat, longitude: coor.log))
        }
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 5
        polyline.geodesic = true
        polyline.map = mapView
    }

    @IBAction func changeSharedStatus(_ sender: UISwitch) {
        let alert = UIAlertController(title: "Change share status", message: nil, preferredStyle: .alert)
        
        if sender.isOn {
            alert.message = "Do you want to share your plogging record?"
        } else {
            alert.message = "Don't you want to share your plogging record?"
        }
        
        let ok = UIAlertAction(title: "Yes", style: .default) { _ in
            self.plogging.shareState = self.plogging.shareState == 0 ? 1 : 0
            PloggingNetManager.shared.updateSharedState(self.plogging) {
                
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            sender.isOn = !sender.isOn
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
}
