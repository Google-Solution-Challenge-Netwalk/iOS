//
//  RankManager.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/21.
//

import Foundation

class RankingManager {
    static let shared = RankingManager()
    private init() {}
    
    var rankings: [Ranking] = []
}
