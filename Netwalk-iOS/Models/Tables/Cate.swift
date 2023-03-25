//
//  Cate.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/21.
//

import Foundation

struct CateLists: Codable {
    var object: [Cate]
}

struct Cate: Codable {
    var category: String?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
    }
}
