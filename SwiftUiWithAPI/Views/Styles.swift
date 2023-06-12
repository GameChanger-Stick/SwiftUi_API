//
//  Styles.swift
//  ABI Project
//
//  Created by Ram Pujan Singh on 24/01/22.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension UIColor {
    static var myAppRed: UIColor {
        return UIColor(red: 1, green: 0.1, blue: 0.1, alpha: 1)
    }
    static var myAppGreen: UIColor {
        return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    }
    static var myAppBlue: UIColor {
        return UIColor(red: 0.2, green: 0.4, blue: 0.7, alpha: 1)
        //return UIColor(Color(hex: 0xffe700))
    }
}

extension UIFont {
    static var myAppTitle: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    static var myAppBody: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
}

class MyAppStyle {
    static let titleColor = UIColor.myAppGreen
    static let subtitleColor = UIColor.myAppBlue
    static let bodyColor = UIColor.black
    static let backgroundColor = UIColor.myAppBlue
    static let actionColor = UIColor.myAppRed
    static let accentColor = UIColor.myAppGreen

    static let headerFont = UIFont.myAppTitle
    static let bodyFont = UIFont.myAppBody
}
