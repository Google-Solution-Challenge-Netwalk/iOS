//
//  RankingNetManager.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/21.
//

import Foundation

class RankingNetManager {
    static let shared = RankingNetManager()
    private init() {}
    
    func ranking(_ type: String, completion: @escaping ([Ranking])->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/act/rank/\(type)") else {
            print("URL Error")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            if err != nil {
                print("Place Net Error")
                return
            }
            
            guard let response = res as? HTTPURLResponse, (200 ..< 299) ~=
                    response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(RankingList.self, from: safeData)
                    dump(decodedData)
                    completion(decodedData.object)
                } catch {
                    print("Decode Error")
                }
            }
        }.resume()
    }
}
