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
    
    var groups: [Group] = [] {
        didSet {
            activateGroup = groups.filter { group in
                return group.actStatus == 1
            }
            inactivateGroup = groups.filter { group in
                return group.actStatus == 0
            }
        }
    }
    var activateGroup: [Group] = []
    var inactivateGroup: [Group] = []
}
