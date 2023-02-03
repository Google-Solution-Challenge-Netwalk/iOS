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
    var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMapView()
        setupLocation()
    }
    

    func loadMapView() {
        let myLocation = locationManager.location?.coordinate
        let latitude = myLocation?.latitude ?? 0.0
        let longitude = myLocation?.longitude ?? 0.0
        
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 18)
        mapView = GMSMapView(frame: self.view.bounds, camera: camera)
        
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        view.addSubview(mapView)
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 거리 정확도 설정
        locationManager.requestWhenInUseAuthorization() // 사용자에게 허용 받기 alert 띄우기
        
        // 아이폰 설정에서의 위치 서비스가 켜진 상태
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation() // 위치 정보 받아오기 시작
                print(self.locationManager.location?.coordinate)
            } else {
                print("위치 서비스 Off 상태")
            }
        }
    }

}

extension PloggingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        if let location = locations.first {
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
            
            // 위치 업데이트할 때마다 카메라 위치 이동
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let cam = GMSCameraUpdate.setTarget(coordinate)
            mapView.animate(with: cam)
            
        }
    }
}
