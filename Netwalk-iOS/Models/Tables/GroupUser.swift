//
//  GroupUser.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/24.
//

import Foundation

struct GroupUserLists: Codable {
    var object: [GroupUser]

}

struct GroupUser: Codable {
    var user_no: Int?
    var name: String?
    var total_act_distance: Double?
    var total_act_time: Double?
}
