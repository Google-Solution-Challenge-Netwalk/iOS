//
//  UserGroup.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import Foundation

struct GroupLists: Codable {
    var object: [Group]
}

struct Group: Codable {
    var groupNo: Int
    var name: String
    var capacity: Int
    var participant: Int  // 0: 비활성화 , 1: 활성화
    var category: String
    var actStatus: Int?
    
    enum CodingKeys: String, CodingKey {
        case groupNo = "group_no"
        case actStatus = "act_st"
        case name, capacity, participant, category
    }
}
