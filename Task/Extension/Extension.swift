//
//  Extension.swift
//  Task
//
//  Created by vinumurugan E on 24/02/22.
//

import Foundation
import UIKit

extension Int {
    func covertToFileString() -> String {
        var convertedValue: Double = Double(self)
        var multiplyFactor = 0
        let tokens = ["bytes", "KB", "MB", "GB", "TB", "PB",  "EB",  "ZB", "YB"]
        while convertedValue > 1024 {
            convertedValue /= 1024
            multiplyFactor += 1
        }
        return String(format: "%4.2f %@", convertedValue, tokens[multiplyFactor])
    }
}


extension String {
    func geneic_Color() -> UIColor {
        
        var color = UIColor.gray
        var colors = [["letter":"A","color":"#28AE7B"],["letter":"B","color":"#67E6EC"],["letter":"C","color":"#00B2EE"],["letter":"D","color":"#F3E88E"],["letter":"E","color":"#FFD39B"],["letter":"F","color":"#687C97"],["letter":"G","color":"#9B30FF"],["letter":"H","color":"#FFC469"],["letter":"I","color":"#A9C9A4"],["letter":"J","color":"#F6CCDA"],["letter":"K","color":"#A9A9A9"],["letter":"L","color":"#8F8FBC"],["letter":"M","color":"#7FFFD4"],["letter":"N","color":"#A4D3EE"],["letter":"O","color":"#9F5F9F"],["letter":"P","color":"#60AFFE"],["letter":"Q","color":"#EAEAAE"],["letter":"R","color":"#C5E3BF"],["letter":"S","color":"#00C5CD"],["letter":"T","color":"#B9D3EE"],["letter":"U","color":"#EEB4B4"],["letter":"V","color":"#EEE685"],["letter":"W","color":"#9CBA7F"],["letter":"X","color":"#007FFF"],["letter":"Y","color":"#EE6A50"],["letter":"Z","color":"#000080"]]
        
        if !self.isEmpty {
            colors = colors.filter({
                ($0["letter"]!).contains(self.first!)
            })
        }
        
        if colors.count > 0 {
            if let colorHex = colors.first!["color"] {
                color = hexStringToUIColor(hex: colorHex)
            }
        }
        return color
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}




