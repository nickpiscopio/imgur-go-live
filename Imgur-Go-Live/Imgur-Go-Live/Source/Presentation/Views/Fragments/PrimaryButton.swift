//
//  PrimaryButton.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct PrimaryButton: View {
    let buttonText: String
    var cornerRadius: CGFloat = .dimen8
    var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView(isLoading: .constant(true))
            } else {
                Text(buttonText)
                    .imgurGoLiveText(fontName: .openSansBold, fontSize: .dimen16, textColor: Color.imgurGoLiveWhite100)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.dimen16)
        .background(
            Rectangle()
                .fill(Color.imgurGoLiveBlue100)
                .cornerRadius(cornerRadius)
        )
    }
}
