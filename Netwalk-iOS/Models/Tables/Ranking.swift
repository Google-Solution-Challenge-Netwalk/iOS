//
//  Ranking.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/21.
//

import Foundation

struct RankingList: Codable {
    var object: [Ranking]
}

struct Ranking: Codable {
    var userNo: Int?
    var userName: String?
    var userRank: Int?
    var totalActDist: Double?
    var totalActTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case userNo = "user_no"
        case userRank = "ranking"
        case totalActTime = "total_act_time"
        case totalActDist = "total_act_distance"
        case userName = "name"
    }
}
