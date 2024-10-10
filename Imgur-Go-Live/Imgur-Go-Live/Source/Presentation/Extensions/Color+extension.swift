//
//  Color+extension.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

enum imgurGoLiveColor: String {
    case imgurGoLiveBlack5 = "black5"
    case imgurGoLiveBlack20 = "black20"
    case imgurGoLiveBlack50 = "black50"
    case imgurGoLiveBlack80 = "black80"
    case imgurGoLiveBlue100 = "blue100"
    case imgurGoLiveWhite100 = "white100"
}

extension Color {
    static var imgurGoLiveBlack5: Color { Color(imgurGoLiveColor.imgurGoLiveBlack5.rawValue) }
    static var imgurGoLiveBlack20: Color { Color(imgurGoLiveColor.imgurGoLiveBlack20.rawValue) }
    static var imgurGoLiveBlack50: Color { Color(imgurGoLiveColor.imgurGoLiveBlack50.rawValue) }
    static var imgurGoLiveBlack80: Color { Color(imgurGoLiveColor.imgurGoLiveBlack80.rawValue) }
    static var imgurGoLiveBlue100: Color { Color(imgurGoLiveColor.imgurGoLiveBlue100.rawValue) }
    static var imgurGoLiveWhite100: Color { Color(imgurGoLiveColor.imgurGoLiveWhite100.rawValue) }
}
