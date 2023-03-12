//
//  ActiveUser.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/14.
//

import Foundation

struct ActiveUser {
    let userProfileImage: String
    let userTrashNumber: String
    let userTrashBackground: String
    let userName: String
    let userTime: String
    let userKm: String
    
    init(userProfileImage:String, userTrashNumber:String, userTrashBackground:String, userName: String, userTime:String, userKm:String){
        self.userProfileImage = userProfileImage
        self.userTrashNumber = userTrashNumber
        self.userTrashBackground = userTrashBackground
        self.userName = userName
        self.userTime = userTime
        self.userKm = userKm
    }
}
