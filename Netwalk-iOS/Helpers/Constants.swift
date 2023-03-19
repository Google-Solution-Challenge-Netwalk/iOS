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
    
    static func convertToString(_ timeInterval: Int) -> String {
        
        let hours = timeInterval / 3600
        let minutes = (timeInterval % 3600) / 60
        let seconds = (timeInterval % 3600 % 60)
        
        var components = DateComponents()
        components.hour = hours
        components.minute = minutes
        components.second = seconds
        
        let date = Calendar.current.date(from: components)!
        
        return CustomDateFormatter.format.string(from: date)
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

