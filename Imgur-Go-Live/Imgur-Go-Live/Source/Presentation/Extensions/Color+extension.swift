//
//  Color+extension.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

enum imgurGoLiveColor: String {
    case imgurGoLiveBlack100 = "black100"
    case imgurGoLiveBlue100 = "blue100"
    case imgurGoLiveWhite100 = "white100"
}

extension Color {
    static var imgurGoLiveBlack20: Color { Color(imgurGoLiveColor.imgurGoLiveBlack100.rawValue).opacity(0.2) }
    static var imgurGoLiveBlack50: Color { Color(imgurGoLiveColor.imgurGoLiveBlack100.rawValue).opacity(0.5) }
    static var imgurGoLiveBlack80: Color { Color(imgurGoLiveColor.imgurGoLiveBlack100.rawValue).opacity(0.8) }
    static var imgurGoLiveBlue100: Color { Color(imgurGoLiveColor.imgurGoLiveBlue100.rawValue) }
    static var imgurGoLiveWhite50: Color { Color(imgurGoLiveColor.imgurGoLiveWhite100.rawValue).opacity(0.5) }
    static var imgurGoLiveWhite65: Color { Color(imgurGoLiveColor.imgurGoLiveWhite100.rawValue).opacity(0.65) }
    static var imgurGoLiveWhite85: Color { Color(imgurGoLiveColor.imgurGoLiveWhite100.rawValue).opacity(0.85) }
    static var imgurGoLiveWhite100: Color { Color(imgurGoLiveColor.imgurGoLiveWhite100.rawValue) }
}
