//
//  ImgurGoLiveTextFieldStyle.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct ImgurGoLiveTextFieldStyle: TextFieldStyle {
    var cornerRadius: CGFloat = .dimen8
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, .dimen12)
            .padding(.horizontal, .dimen16)
            .font(Font.custom(FontName.openSansBold.rawValue, size: .font16))
            .foregroundColor(Color.imgurGoLiveBlack80)
            .background(Color.imgurGoLiveWhite50)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.imgurGoLiveBlack20, lineWidth: .dimen2)
            )
            .cornerRadius(cornerRadius)
    }
}
