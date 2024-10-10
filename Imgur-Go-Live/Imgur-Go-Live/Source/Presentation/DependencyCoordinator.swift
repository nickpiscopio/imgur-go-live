//
//  DependencyCoordinator.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI
import Combine

class DependencyCoordinator: ObservableObject {
    // Services
    @Published var galleryService = GalleryService(repo: GalleryRepository())
    
    // Managers
    @Published var alertManager = AlertManager()
    @Published var navigationManager = NavigationManager()
    
    private var alertManagerCancellable : AnyCancellable?
    private var navigationManagerCancellable: AnyCancellable?
    
    init() {
        self.alertManagerCancellable = self.alertManager.$alert.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        
        self.navigationManagerCancellable = self.navigationManager.$path.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
