//
//  CoordinatorView.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = DependencyCoordinator()
    
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $coordinator.navigationManager.path) {
            coordinator.navigationManager.build(screen: .search)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.navigationManager.build(screen: screen)
                        .navigationBarBackButtonHidden(true)
                }
                
        }
        .alert(item: $coordinator.alertManager.alert) { alert in
            guard alert.negativeAction != nil else {
                return Alert(
                    title: Text(alert.title),
                    message: Text(alert.description),
                    dismissButton: .default(Text(alert.positiveAction.title), action: alert.positiveAction.action)
                )
            }
            
            return Alert(
                title: Text(alert.title),
                message: Text(alert.description),
                primaryButton: .destructive(Text(alert.negativeAction?.title ?? ""), action: alert.negativeAction?.action),
                secondaryButton: .default(Text(alert.positiveAction.title), action: alert.positiveAction.action)
            )
        }
        .environmentObject(coordinator)
    }
}

