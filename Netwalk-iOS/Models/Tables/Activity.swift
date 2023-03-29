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
    var groupNo: [Int]?
    var actNo: Int?
    var totalActDist: Double
    var totalActTime: Int
    var shareState: Int
    var actState: String?
    var coordinates: [Coordinate]
    var registDate: String?
    var name: String?
    var trashCnt: Int?
    
    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case groupNo = "group_no"
        case actNo = "act_no"
        case totalActDist = "total_act_distance"
        case totalActTime = "total_act_time"
        case shareState = "share_st"
        case actState = "act_st"
        case coordinates = "distances"
        case registDate = "reg_dt"
        case trashCnt = "trash_cnt"
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

struct ActivityObject: Codable {
    var object: Int
}

struct StartPloggingData: Codable {
    var user_no: Int
    var groups: [Int]?
    var act_st: String
}
