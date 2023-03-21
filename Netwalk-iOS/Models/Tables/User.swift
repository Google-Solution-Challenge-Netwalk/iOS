//
//  User.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/12.
//

import Foundation

struct UserLists: Codable {
    var object: [User]
}

struct User: Codable {
    var user_no: Int?
    var email: String?
    var name: String?
}


struct UserPlogDataObject: Codable {
    var object: UserPlogData
}

struct UserPlogData: Codable {
    var actCnt: Int
    var totalActDist: Double
    var totalActTime: Int
    var totalActTrash: Int
    
    enum CodingKeys: String, CodingKey {
        case actCnt = "act_cnt"
        case totalActDist = "total_act_distance"
        case totalActTime = "total_act_time"
        case totalActTrash = "total_act_trash"
    }
}
