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
}


struct PhotoCVCell {
    static let spacingWitdh: CGFloat = 0
    static let cellColumns: CGFloat = 3
    private init() {}
}


