//
//  NavigationManager.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

enum Screen: Hashable {
    case search
    case results([ImgurAlbum])
}

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateBack(totalScreensToPop: Int = 1) {
        pop(totalScreensToPop: totalScreensToPop)
    }
    
    func push(screen: Screen) {
        path.append(screen)
    }
    
    private func pop(totalScreensToPop: Int = 1) {
        path.removeLast(totalScreensToPop)
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .search:
            SearchView()
        case .results(let albums):
            ResultsView(albums: albums)
        }
    }
}
