//
//  Trash.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/26.
//

import Foundation

struct TrashList: Codable {
    var object: [Trash]
}

struct Trash: Codable {
    var trashNo: Int
    var imageUrl: String
    var category: String
    
    enum CodingKeys: String, CodingKey {
        case trashNo = "trash_no"
        case imageUrl = "img_url"
        case category
    }
}
