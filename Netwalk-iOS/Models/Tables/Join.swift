//
//  Join.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/26.
//

import Foundation

struct JoinLists: Codable {
    var object: [Join]
}

struct Join: Codable {
    var userNo: Int
    var groupNo: Int
    
    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case groupNo = "group_no"
    }
}
