//
//  PloggingViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit
import GoogleMaps
import CoreLocation

class PloggingViewController: UIViewController {
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMapView()
        setupLocation()
    }
    

    func loadMapView() {
        let camera = GMSCameraPosition(latitude: 1.285, longitude: 103.848, zoom: 12)
        let mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), camera: camera)
        
        
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        view.addSubview(mapView)
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 거리 정확도 설정
        locationManager.requestWhenInUseAuthorization() // 사용자에게 허용 받기 alert 띄우기
        
        // 아이폰 설정에서의 위치 서비스가 켜진 상태
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation() // 위치 정보 받아오기 시작
            print(locationManager.location?.coordinate)
        } else {
            print("위치 서비스 Off 상태")
        }
    }

}

extension PloggingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        if let location = locations.first {
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
        }
    }
}
