//
//  Plogging.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/13.
//

import Foundation


struct ActivityList: Codable {
    var object: [Activity]
}


struct Activity: Codable {
    var userNo: Int?
    var groupNo: Int?
    var actNo: Int?
    var totalActDist: Double
    var totalActTime: Int
    var shareState: Int
    var coordinates: [Coordinate]
    var registDate: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case groupNo = "group_no"
        case actNo = "act_no"
        case totalActDist = "total_act_distance"
        case totalActTime = "total_act_time"
        case shareState = "share_st"
        case coordinates = "distances"
        case registDate = "reg_dt"
        case name
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
