//
//  GroupNetManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import Foundation

class GroupNetManager {
    static let shared = GroupNetManager()
    private init() {}
    
    // 내가 참여한 그룹
    func readPartGroup(_ userNo: Int, completion: @escaping ([Group])->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/group/part/\(userNo)") else {
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
                    let decodedData = try JSONDecoder().decode(GroupLists.self, from: safeData)
                    dump(decodedData)
                    completion(decodedData.object)
                } catch {
                    print("Decode Error")
                }
            }
        }.resume()
    }
}
