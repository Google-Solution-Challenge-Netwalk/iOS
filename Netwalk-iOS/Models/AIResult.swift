//
//  AIResult.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/12.
//

import Foundation

struct AIResult: Codable {
    let trash: String
    let accuracy: Double
    
    enum CodingKeys: String, CodingKey {
        case trash = "Garbage"
        case accuracy = "Accuracy"
    }
}
