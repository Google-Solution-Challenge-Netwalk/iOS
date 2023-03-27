//
//  UserNetManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/12.
//

import Foundation

class UserNetManager {
    static let shared = UserNetManager()
    private init() {}
    
    // 그룹 가입
    func joinGroup(_ user: Join, completion: @escaping ()->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        let param = ["user_no":10, "group_no":30]
        guard let url = URL(string: "\(urlKey)/api/v1/group/part") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
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
    
    // 그룹별 가입된 사용자 정보
    func readGroupUsers(_ groupNo: Int, completion: @escaping ([GroupUser])->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/group/\(groupNo)") else {
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
                    let decodedData = try JSONDecoder().decode(GroupUserLists.self, from: safeData)
                    dump(decodedData.object)
                    completion(decodedData.object)
                } catch {
                    print("Decode Error")
                }
            }
        }.resume()
    }
    
    func login(user: User, completion: @escaping(Int)->()) {
        
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/user/login") else {
            print("URL Error")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
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
                    let decodedData = try JSONDecoder().decode(User.self, from: safeData)
                    dump(decodedData)
                
                    completion(decodedData.user_no!)
                } catch {
                    print("Decode Error")
                }
            }
            //completion()
            
        }.resume()
    }
    
    func getUserPlogData(_ userNo: Int, completion: @escaping (UserPlogData)->()) {
        let urlKey = Bundle.main.getSecretKey(key: "REST_API_URL")
        
        guard let url = URL(string: "\(urlKey)/api/v1/user/me/\(userNo)") else {
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
                    let decodedData = try JSONDecoder().decode(UserPlogDataObject.self, from: safeData)
                    dump(decodedData)
                    completion(decodedData.object)
                } catch {
                    print("Decode Error")
                }
            }
        }.resume()
    }
}
