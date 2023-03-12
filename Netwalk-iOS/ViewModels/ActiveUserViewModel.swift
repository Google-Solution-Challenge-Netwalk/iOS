//
//  ActiveUserViewModel.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/12.
//

import Foundation

class ActiveUserViewModel {
    let activeUsers: [ActiveUser] = [
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km"),
        ActiveUser(userProfileImage: "overseas", userName: "Netwalk", userTime: "3:24:52", userKm: "17.41km")
    ]
    
    var listCount:Int {
        return activeUsers.count
    }
    func getActiveUser(at idx: Int) -> ActiveUser{
        return activeUsers[idx]
    }
}
