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
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var totalDistance: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    var locationManager = CLLocationManager()
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLocation()
    }
    
    func setupView() {
        loadMapView()
        topView.layer.cornerRadius = 10
    }
    

    func loadMapView() {
        // 현재 내 위치 가져오기
        print(#function)
        let myLocation = locationManager.location?.coordinate
        let latitude = myLocation?.latitude ?? 0.0
        let longitude = myLocation?.longitude ?? 0.0
        
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 18)
        mapView = GMSMapView(frame: self.view.bounds, camera: camera)
        mapView.delegate = self
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        view.addSubview(mapView)
        view.bringSubviewToFront(topView)
    }
    
    func setupLocation() {
        print(#function)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 거리 정확도 설정
        locationManager.requestWhenInUseAuthorization() // 사용자에게 허용 받기 alert 띄우기
        
        // 아이폰 설정에서의 위치 서비스가 켜진 상태
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation() // 위치 정보 받아오기 시작
            } else {
                print("위치 서비스 Off 상태")
            }
        }
    }

}

// MARK: - GMSMapViewDelegate
extension PloggingViewController: GMSMapViewDelegate {

}

// MARK: - CLLocationManagerDelegate
extension PloggingViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 몇 초마다 호출되는지 체크해보기
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
