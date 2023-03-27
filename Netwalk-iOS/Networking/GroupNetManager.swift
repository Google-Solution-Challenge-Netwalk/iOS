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
    
    // 그룹 생성
    func createGroup (_ group: Group, completion: @escaping ()->()) {
        
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/group") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(group) else {
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
    
    // 카테고리별 그룹 보기
    func readCategoryGroup(_ category: String, completion: @escaping ([Group])->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        let param = ["category":category]
        
        guard let url = URL(string: "\(urlKey)/api/v1/group/cate") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(param) else {
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

            guard let response = res as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print(res)
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
    
    // 내가 참여한 그룹
    func readPartGroup(_ userNo: Int, completion: @escaping ([Group])->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        let param = ["user_no":userNo]
        guard let url = URL(string: "\(urlKey)/api/v1/group/part/me") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(param) else {
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
            
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(GroupLists.self, from: safeData)
                    dump(decodedData.object)
                    completion(decodedData.object)
                } catch {
                    print("Decode Error")
                }
            }
            
        }.resume()
    }
}
