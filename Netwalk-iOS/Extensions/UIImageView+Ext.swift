//
//  UIImageView+Ext.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/27.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                print("Image load Err")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
        }
    }
}
