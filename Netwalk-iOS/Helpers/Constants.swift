//
//  Constants.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/15.
//

import Foundation


struct CustomDateFormatter {
    private init() {}
    
    static let format: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    static func convertToSeconds(_ hrsString: String) -> Int {
        let components = hrsString.split(separator: ":").compactMap { Int($0)! }
        
        let hours = components[0]
        let minutes = components[1]
        let seconds = components[2]
        
        return hours * 3600 + minutes * 60 + seconds
    }
}


struct PhotoCVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}


enum UserDefaultsKey {
    static let key = "user"
}

