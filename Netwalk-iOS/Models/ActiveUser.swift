//
//  ActiveUser.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/13.
//

import Foundation

struct ActiveUser {
    let userProfileImage: String
    let userName: String
    let userTime: String
    let userKm: String
    
    init(userProfileImage: String, userName: String, userTime: String, userKm: String) {
        self.userProfileImage = userProfileImage
        self.userName = userName
        self.userTime = userTime
        self.userKm = userKm
    }
}
