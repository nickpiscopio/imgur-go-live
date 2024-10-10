//
//  ContentView.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var coordinator: DependencyCoordinator
    @StateObject private var viewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            form
        }
        .background(Image(.landscape).blur(radius: 10))
        .onAppear {
            viewModel.initDependencies(coordinator)
        }
    }
    
    private var form: some View {        
        VStack(spacing: 0) {
            Spacer()
            
            VStack(alignment: .leading, spacing: .dimen24) {
                Text("search_welcome_title")
                    .imgurGoLiveTitle()
                VStack(alignment: .leading, spacing: .dimen8) {
                    Text("search_welcome_description")
                        .imgurGoLiveBody()
                    
                    TextField("", text: $viewModel.searchQuery)
                        .textFieldStyle(ImgurGoLiveTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }
                
                Button {
                    viewModel.search()
                } label: {
                    PrimaryButton(buttonText: String(localized: "search_button_title"), isLoading: viewModel.isLoading)
                }
            }
            .padding(.dimen16)
            .cardBackground()
            
            Spacer()
        }
        .padding(.dimen16)
    }
}

class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var isLoading: Bool = false
    
    private var coordinator: DependencyCoordinator?
    
    func initDependencies(_ coordinator: DependencyCoordinator) {
        self.coordinator = coordinator
    }
    
    func search() {
        isLoading = true
        
        if (hasError()) {
            displayError()
            isLoading = false
            return
        }
        
        let dto = SearchDto(query: searchQuery)
        
        Task {
            do {
                let data = try await self.coordinator?.galleryService.search(dto: dto)

                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    self.tryToPushToResultScreen(withData: data)
                }
            } catch {
                DispatchQueue.main.async {
                    self.displayError()
                    self.isLoading = false
                }
            }
        }
    }
    
    private func tryToPushToResultScreen(withData response: SearchResponse?) {
        guard let images = response?.data else {
            self.displayError()

            return
        }
        
        coordinator?.navigationManager.push(screen: .results(images))
    }
    
    private func hasError() -> Bool {
        searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func displayError() {
        let title = String(localized: "search_error_title")
        let description = String(localized: "search_error_description")
        let positiveAction = AlertAction(title: String(localized: "default_ok")) { }
        
        self.coordinator?.alertManager.display(ImgurGoLiveAlert(title: title, description: description, positiveAction: positiveAction))
    }
}

#Preview {
    SearchView()
}
