//
//  Constant.swift
//  Design
//
//  Created by Sarwopari Patodi on 18/08/22.
//

import Foundation
import UIKit

public struct Constant {
    struct FontNames {
        static let RobotoMedium = "Roboto-Medium"
        static let RobotoLight = "Roboto-Light"
        static let RobotoCondensedBold = "RobotoCondensed-Bold"
        static let RobotoCondensedLight = "RobotoCondensed-Light"
        static let RubikItalic = "Rubik-Italic"
        static let RubikLight = "Rubik-Light"
        static let RubikLightItalic = "Rubik-LightItalic"
        static let RubikMedium = "Rubik-Medium"
        static let RubikMediumItalic = "Rubik-MediumItalic"
        static let RubikRegular = "Rubik-Regular"
        static let PingFangSCMedium = "PingFangSC-Medium"
        static let OverpassMonoLight = "OverpassMono-Light"
        static let OverpassMonoBold = "OverpassMono-Bold"
        static let OverpassBold = "Overpass-Bold"
    }
    struct Colors {
        static let color000000: UIColor = UIColor.black
        static let color424355: UIColor = getColorFromHex(0x424355)
        static let color434553: UIColor = getColorFromHex(0x434553)
        static let colorFFFFFF: UIColor = getColorFromHex(0xFFFFFF)
        static let colorF5F5DC: UIColor = getColorFromHex(0xF5F5DC)
        static let colorFFFDD0: UIColor = getColorFromHex(0xFFFDD0)
        static let colorF0E68C: UIColor = getColorFromHex(0xF0E68C)
        static let colorFFDB58: UIColor = getColorFromHex(0xFFDB58)
        static let colorF4F4F4: UIColor = getColorFromHex(0xF4F4F4)
    }
    
    static func getColorFromHex(_ rgbValue: Int) -> UIColor {
        UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0xFF) / 255.0, alpha: 1.0)
    }
}
