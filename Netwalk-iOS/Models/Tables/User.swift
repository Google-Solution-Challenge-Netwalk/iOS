//
//  User.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/12.
//

import Foundation

struct UserLists: Codable {
    var object: [User]

}

struct User: Codable {
    var user_no: Int?
    var email: String?
    var name: String?
}

