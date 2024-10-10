//
//  CardBackground.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct CardBackground: ViewModifier {
    var radius: CGFloat = .dimen8
    var backgroundColor = Color.imgurGoLiveWhite65
    var strokeColor = Color.imgurGoLiveWhite85
    var borderWidth: CGFloat = .dimen1
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(backgroundColor)
                    .stroke(strokeColor, lineWidth: borderWidth)
            )
    }
}
