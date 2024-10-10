//
//  Font+extension.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

extension Text {
    func imgurGoLiveTitle() -> some View {
        imgurGoLiveText(fontName: .openSansBold, fontSize: .font20)
    }
    
    func imgurGoLiveBody() -> some View {
        imgurGoLiveText(fontName: .openSansRegular, fontSize: .font16)
    }
    
    func imgurGoLiveText(fontName: FontName = FontName.openSansRegular, fontSize: CGFloat = .font14, textColor: Color = .imgurGoLiveBlack80) -> some View {
        self
            .foregroundColor(textColor)
            .font(Font.custom(fontName.rawValue, size: fontSize))
    }
}
