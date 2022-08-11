//
//  Extensions.swift
//  Lofi
//
//  Created by Nathan Cheng on 8/9/22.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let backgroundColor = Color.rgb(r: 12, g: 40, b: 40)
    static let buttonColor = Color.rgb(r: 255, g: 10, b: 20)
}
