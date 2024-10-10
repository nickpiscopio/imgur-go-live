//
//  NavView.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct DefaultNavTitleView: View {
    var titleRes: LocalizedStringResource
    var body: some View {
        Text(String(localized: titleRes))
            .imgurGoLiveText(fontName: .openSansBold, fontSize: .dimen16)
    }
}

struct NavBackView: View {
    let onTap: (() -> Void)?
    
    init(
        onTap: (() -> Void)? = nil
    ) {
        self.onTap = onTap
    }
    
    var body: some View {
        NavWidget(content: Image(.back), onTap: onTap)
            .foregroundColor(Color.imgurGoLiveBlack80)
    }
}

struct NavWidget<Content: View>: View {
    let content: () -> Content
    let onTap: (() -> Void)?
    
    init(
        content: @autoclosure @escaping () -> Content = EmptyView(),
        onTap: (() -> Void)? = nil
    ) {
        self.content = content
        self.onTap = onTap
    }
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            content()
        }
        .disabled(onTap == nil)
    }
}

struct NavView<LeadingView: View, TitleView: View, TrailingView: View>: View {
    let leadingView: () -> LeadingView
    let titleView: () -> TitleView
    let trailingView: () -> TrailingView
    var navColor: Color
    
    @State var leadingViewSize: CGSize = .zero
    @State var trailingViewSize: CGSize = .zero
    
    init(
        leadingView: @autoclosure @escaping () -> LeadingView = EmptyView(),
        titleView: @autoclosure @escaping () -> TitleView = EmptyView(),
        trailingView: @autoclosure @escaping () -> TrailingView = EmptyView(),
        navColor: Color = .imgurGoLiveWhite100
    ) {
        self.leadingView = leadingView
        self.titleView = titleView
        self.trailingView = trailingView
        self.navColor = navColor
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                ChildSizeReader(size: $leadingViewSize) {
                    leadingView()
                }
                
                Spacer()
                
                titleView()
                    .padding(.leading, getLeadingPadding())
                    .padding(.trailing, getTrailingPadding())
                
                Spacer()
                
                ChildSizeReader(size: $trailingViewSize) {
                    trailingView()
                }
            }
            .padding(.dimen16)
            
            Rectangle()
                .fill(Color.imgurGoLiveBlack20)
                .frame(maxWidth: .infinity)
                .frame(height: 1)
        }
        .background(navColor)
    }
    
    private func getLeadingPadding() -> CGFloat {
        !hasLeadingView() && hasTrailingView() ? trailingViewSize.width : 0
    }
    
    private func getTrailingPadding() -> CGFloat {
        hasLeadingView() && !hasTrailingView() ? leadingViewSize.width : 0
    }
    
    private func hasLeadingView() -> Bool {
        LeadingView.self != EmptyView.self
    }
    
    private func hasTrailingView() -> Bool {
        TrailingView.self != EmptyView.self
    }
}

#Preview {
    NavView()
}
