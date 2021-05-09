//
//  AppColor.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit

extension UIColor {
    enum label {
        static let secondaryText = UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1)
        
        static let accentText = UIColor(red: 0.842, green: 0, blue: 0, alpha: 1)
    }
    
    enum view {
        static let secondaryBackground = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    }
    
    enum chipView {
        static let colorList = [
            UIColor(red: 0.7, green: 0.899, blue: 1, alpha: 1),
            UIColor(red: 0.684, green: 0.976, blue: 0.909, alpha: 1),
            UIColor(red: 0.809, green: 0.724, blue: 0.996, alpha: 1),
            UIColor(red: 0.979, green: 0.721, blue: 0.722, alpha: 1)
        ]
        
        static let invertedPrimaryBackGround = UIColor.black
    }
    
    enum button {
        static let primaryBackground = UIColor(red: 0.392, green: 0.604, blue: 1, alpha: 1)
    }
}
