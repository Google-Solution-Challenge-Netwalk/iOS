//
//  PloggingNetManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/13.
//

import Foundation

class PloggingNetManager {
    static let shared = PloggingNetManager()
    private init() {}
    
    func create(_ ploggingData: Plogging, completion: @escaping ()->()) {
        
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/act") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(ploggingData) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            
            guard err == nil else {
                print("Error: error calling POST")
                print(err)
                return
            }

            // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
            guard let response = res as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            completion()
            
        }.resume()
    }
}
