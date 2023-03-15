//
//  Plogging.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/13.
//

import Foundation

struct Activity: Codable {
    var userNo: Int
    var groupNo: Int
    var totalActDist: Double
    var totalActTime: Int
    var shareState: Int
    var customList: [Coordinate]
    
    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case groupNo = "group_no"
        case totalActDist = "total_act_distance"
        case totalActTime = "total_act_time"
        case shareState = "share_st"
        case customList
    }
}

struct Coordinate: Codable {
    var lat: Double
    var log: Double
    
    enum CodingKeys: String, CodingKey {
        case lat = "latitude"
        case log = "longitude"
    }
}
