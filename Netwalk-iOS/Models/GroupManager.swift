//
//  GroupManager.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import Foundation

class GroupManager {
    static let shared = GroupManager()
    private init() {}

    var groups: [Group] = []
}
