//
//  AINetManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/12.
//

import UIKit
import Alamofire

class AINetManager {
    static let shared = AINetManager()
    private init() {}
    
    func requestTrashtDetection(actNo: Int, image: UIImage, completion: @escaping()->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        let url = "\(urlKey)/model/"
        
        let headers: HTTPHeaders = [ "Content-Type" : "multipart/form-data" ]

        let file = image.pngData()!
        
        // 멀티파트 통신
        AF.upload(multipartFormData: { (multipartFormData) in

            multipartFormData.append(file, withName: "file", fileName: "test.png", mimeType: "multipart/form-data")
            
            multipartFormData.append("\(actNo)".data(using: .utf8)!, withName: "act_no")

        }, to: url, method: .post, headers: headers).responseJSON { (response) in

            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)

//            guard let safeData = response.data else { return }
//
//            let decodedData = try? JSONDecoder().decode(AIResult.self, from: safeData)
//            guard let data = decodedData else { return }
//            
//            dump(data)
            
            completion()
            
        }
    }
}
