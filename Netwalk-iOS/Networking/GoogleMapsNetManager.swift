//
//  GoogleMapsNetManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/11.
//

import Foundation

class GoogleMapsNetManager {
    static let shared = GoogleMapsNetManager()
    private init() {}
    
    func getDistanceMatrix() {
        guard let url = URL(string: "") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
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
            
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(DistanceMatrix.self, from: safeData)
                    dump(decodedData)

                } catch {
                    print("Decode Error")
                }
            }
            
        }.resume()
    }
}
