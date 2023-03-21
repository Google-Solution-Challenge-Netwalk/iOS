//
//  UserManager.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/21.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var users: [User] = []
}
