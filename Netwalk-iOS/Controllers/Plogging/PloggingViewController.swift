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
    var coordinates: [Coordinate] = []
    var count = 0
    
    let camera = UIImagePickerController()
    let path = GMSMutablePath()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLocation()
        setupCamera()
    }
    
    // MARK: - setupView
    private func setupView() {
        // 맵뷰 불러오기
        setupMapView()
        topView.layer.cornerRadius = 10
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.lightGray.cgColor
        
        myLocationButton.layer.cornerRadius = myLocationButton.frame.width / 2
        ploggingButton.layer.cornerRadius = ploggingButton.frame.width / 2
        groupButton.layer.cornerRadius = groupButton.frame.width / 2
        cameraButton.layer.cornerRadius = cameraButton.frame.width / 2
        
        groupInfoLabel.layer.cornerRadius = groupInfoLabel.frame.width / 2
        cameraInfoLabel.layer.cornerRadius = cameraInfoLabel.frame.width / 2
        
        //cameraButton.isHidden = true
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
    
    // MARK: - loadMapView
    // 맵 불러오기
    private func setupMapView() {
        
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
    
    // MARK: - setupCamera
    // 카메라 관련 설정
    private func setupCamera() {
        camera.sourceType = .camera
        camera.allowsEditing = false
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        camera.delegate = self
    }
    
    // MARK: - setupLocation
    // 내 위치 불러오기
    private func setupLocation() {
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
    
    // MARK: - startPlogging
    private func startPlogging() {
        print("start")
        
        totalTime.text = "00:00:00"
        totalDistance.text = "0.00"
        
        coordinates.removeAll() // 누적 좌표 데이터 삭제
        path.removeAllCoordinates() // 누적 path 데이터 삭제
        mapView.clear() // 지도위에 그려진 polyline 제거
        
        guard let myLocation = mapView.myLocation?.coordinate else { return }
        let coor = Coordinate(lat: myLocation.latitude, log: myLocation.longitude)
        coordinates.append(coor)
        path.add(myLocation)
        //cameraButton.isHidden = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // MARK: - stopPlogging
    private func stopPlogging() {
        print("stop")
        timer.invalidate()
        
        guard let userNo = UserDefaults.standard.getLoginUser()?.user_no else { print("GetUserDefault Error")
            return
        }
        let totalActDist = Double(totalDistance.text!)!
        let totalActTime = CustomDateFormatter.convertToSeconds(totalTime.text!)
        
        let activity = Activity(userNo: userNo, groupNo: 4, totalActDist: totalActDist, totalActTime: totalActTime, shareState: 0, customList: coordinates)
        
        
        // 활동기록 네트워킹 시 가입한 그룹 개수에 맞춰 요청 (DispatchGroup 사용)
        PloggingNetManager.shared.create(activity) {
            print("종료")
        }
    }
    
    // MARK: - myLocationButtonTapped
    @IBAction func myLocationButtonTapped(_ sender: UIButton) {
        
        guard let lat = self.mapView.myLocation?.coordinate.latitude,
              let lng = self.mapView.myLocation?.coordinate.longitude else { return }
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 18)
        self.mapView.animate(to: camera)
    }
    
    // MARK: - ploggingButtonTapped
    @IBAction func ploggingButtonTapped(_ sender: UIButton) {
        if !ploggingStatus {
            
            let alert = UIAlertController(title: "Start Plogging", message: "Do you want to start plogging?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Start", style: .default) { _ in
                sender.setImage(UIImage(systemName: "stop.fill"), for: .normal)
                self.startPlogging() // 플로깅 시작
                self.ploggingStatus = !self.ploggingStatus
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            present(alert, animated: true)
            
        } else {
            
            let alert = UIAlertController(title: "Stop Plogging", message: "Are you sure you want to stop the plogging in progress?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Stop", style: .default) { _ in
                sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
                self.stopPlogging()
                self.ploggingStatus = !self.ploggingStatus
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            present(alert, animated: true)
        }
        
    }
    
    // MARK: - groupButtonTapped
    @IBAction func groupButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ActivateGroupsViewController") as! ActivateGroupsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - cameraButtonTapped
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
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
    
    // MARK: - updateCounter
    @objc func updateCounter() {
        count += 1
        
        if count == 3 {
            guard let myLocation = mapView.myLocation?.coordinate else { return }
            
            // 두 좌표사이 거리 계산
            var distance = distance(lat1: coordinates.last!.lat, lon1: coordinates.last!.log, lat2: myLocation.latitude, lon2: myLocation.longitude, unit: "K")
            
            if distance.isNaN { distance = 0.0 }
            
            let totalDst = Double(totalDistance.text!)!
            totalDistance.text = "\(round((totalDst + distance) * 100) / 100)"
            
            // 현재 좌표 데이터 추가
            coordinates.append(Coordinate(lat: myLocation.latitude, log: myLocation.longitude))
            path.add(myLocation) // path 데이터 추가
            
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 5
            polyline.geodesic = true
            polyline.map = mapView
            
            count = 0
        }
        
        var hrs = CustomDateFormatter.format.date(from: totalTime.text!)!
        hrs.addTimeInterval(1)
        totalTime.text = CustomDateFormatter.format.string(from: hrs)
        
        
    }

}

// MARK: - GMSMapViewDelegate
extension PloggingViewController: GMSMapViewDelegate {
    
}

// MARK: - NavigationControllerDelegate
extension PloggingViewController: UINavigationControllerDelegate {
    
}

// MARK: - CLLocationManagerDelegate
extension PloggingViewController: CLLocationManagerDelegate {
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        if let location = locations.first {
////            print("위도: \(location.coordinate.latitude)")
////            print("경도: \(location.coordinate.longitude)")
//
//            // 위치 업데이트할 때마다 카메라 위치 이동
//            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let cam = GMSCameraUpdate.setTarget(coordinate)
//            mapView.animate(with: cam)
//
//        }
//    }

}

// MARK: - UIImagePickerControllerDelegate
extension PloggingViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        guard let image = info[.originalImage] as? UIImage else { return }
        
        // 인공지능 네트워킹 처리
        
        let alert = UIAlertController(title: "처리 중...", message: "잠시만 기다려주세요.", preferredStyle: .alert)
        
        picker.present(alert, animated: true) {
            AINetManager.shared.requestTrashtDetection(image: image) {
                alert.dismiss(animated: true)
                picker.dismiss(animated: true)
            }
        }
        
        /// 1. AI 서버로 이미지 전송
        
        /// 2. 응답 결과 값을 REST_API 서버로 전송 (Create)
        /// 3. 쓰레기 앨범 화면에서 네트워킹 통신으로 데이터 받아오기
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true)
    }
    
}
