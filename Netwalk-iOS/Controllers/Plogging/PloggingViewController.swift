//
//  PloggingViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit
import GoogleMaps
import CoreLocation

class PloggingViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var totalDistance: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    @IBOutlet weak var myLocationButton: UIButton!
    @IBOutlet weak var ploggingButton: UIButton!
    
    @IBOutlet weak var groupButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var groupInfoLabel: UILabel!
    @IBOutlet weak var cameraInfoLabel: UILabel!
    
    
    var locationManager = CLLocationManager()
    var mapView: GMSMapView!
    var ploggingStatus = false
    var timer = Timer()
    let camera = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLocation()
        setupCamera()
    }
    
    func setupView() {
        // 맵뷰 불러오기
        loadMapView()
        topView.layer.cornerRadius = 10
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.lightGray.cgColor
        
        myLocationButton.layer.cornerRadius = myLocationButton.frame.width / 2
        ploggingButton.layer.cornerRadius = ploggingButton.frame.width / 2
        groupButton.layer.cornerRadius = groupButton.frame.width / 2
        cameraButton.layer.cornerRadius = cameraButton.frame.width / 2
        
        groupInfoLabel.layer.cornerRadius = groupInfoLabel.frame.width / 2
        cameraInfoLabel.layer.cornerRadius = cameraInfoLabel.frame.width / 2
        
        cameraButton.isHidden = true
        cameraInfoLabel.isHidden = true
        groupInfoLabel.isHidden = true
        
        // 스토리보드에 올려진 서브뷰들을 맵뷰 앞으로 가져오기
        view.bringSubviewToFront(topView)
        view.bringSubviewToFront(myLocationButton)
        view.bringSubviewToFront(ploggingButton)
        
        view.bringSubviewToFront(groupButton)
        view.bringSubviewToFront(cameraButton)
        
        view.bringSubviewToFront(groupInfoLabel)
        view.bringSubviewToFront(cameraInfoLabel)
    }
    
    // 맵 불러오기
    func loadMapView() {
        
        print(#function)
        let myLocation = locationManager.location?.coordinate // 현재 내 위치 가져오기
        let latitude = myLocation?.latitude ?? 0.0
        let longitude = myLocation?.longitude ?? 0.0
        
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 18)
        mapView = GMSMapView(frame: self.view.bounds, camera: camera)
        mapView.delegate = self
        //mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        view.addSubview(mapView)
    }
    
    // 카메라 관련 설정
    func setupCamera() {
        camera.sourceType = .camera
        camera.allowsEditing = false
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        camera.delegate = self
    }
    
    // 내 위치 불러오기
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
    
    @IBAction func myLocationButtonTapped(_ sender: UIButton) {
        
        guard let lat = self.mapView.myLocation?.coordinate.latitude,
              let lng = self.mapView.myLocation?.coordinate.longitude else { return }
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 18)
        self.mapView.animate(to: camera)
    }
    
    @IBAction func ploggingButtonTapped(_ sender: UIButton) {
        if ploggingStatus { // 플로깅 활성화 상태
            print("stop")
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
            cameraButton.isHidden = true
            timer.invalidate()
        } else { // 플로깅 비활성화 상태
            print("start")
            sender.setImage(UIImage(systemName: "stop.fill"), for: .normal)
            cameraButton.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        ploggingStatus = !ploggingStatus
    }
    
    @IBAction func groupButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ActivateGroupsViewController") as! ActivateGroupsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "title", message: "message", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { action in
            self.present(self.camera, animated: true)
        }
        
        let trashList = UIAlertAction(title: "Trash List", style: .default) { action in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrashAlbumVC") as! TrashAlbumViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(trashList)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    
    
    @objc func updateCounter() {
        print("--")
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

extension PloggingViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        print(image)
        
        // 인공지능 네트워킹 처리
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
