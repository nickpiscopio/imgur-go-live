//
//  ResultsView.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI
import WrappingHStack

struct ResultsView: View {
    @EnvironmentObject private var coordinator: DependencyCoordinator
    @StateObject private var viewModel: ResultsViewModel = ResultsViewModel()
    
    let albums: [ImgurAlbum]
    
    var body: some View {
        VStack(spacing: 0) {
            header
            content
        }
        .onAppear {
            viewModel.initDependencies(coordinator, albums: albums)
        }
    }
    
    private var header: some View {
        NavView(
            leadingView: NavBackView {
                viewModel.navigateBack()
            },
            titleView: DefaultNavTitleView(titleRes: "results_title")
        )
    }
    
    private var content: some View {
        ScrollView {
            VStack(spacing: .dimen24) {
                ForEach(viewModel.albums) { album in
                    if (album.images.count > 0) {
                        VStack(alignment: .leading, spacing: .dimen8) {
                            Text(album.title)
                                .imgurGoLiveBody()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            WrappingHStack(album.images, id: \.self, alignment: .leading, spacing: .constant(.dimen8), lineSpacing: .dimen8) { image in
                                ZStack {
                                    AsyncImage(url: URL(string: viewModel.getImageLink(link: image.link))) { result in
                                        result.image?
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: viewModel.size, alignment: .center)
                                            .frame(maxHeight: viewModel.size)
                                            .cornerRadius(.dimen8)
                                            .clipped()
                                    }
                                }
                                .frame(width: viewModel.size, alignment: .center)
                                .frame(maxHeight: viewModel.size)
                            }
                        }
                    }
                }
            }
            .padding(.dimen16)
        }
    }
}


class ResultsViewModel: ObservableObject {
    @Published var albums: [ImgurAlbum] = []
    
    let size: CGFloat = 100
    
    private var coordinator: DependencyCoordinator?
    
    func initDependencies(_ coordinator: DependencyCoordinator, albums: [ImgurAlbum]) {
        self.coordinator = coordinator
        self.albums = albums
    }
    
    func navigateBack() {
        coordinator?.navigationManager.navigateBack()
    }
    
    func getImageLink(link: String) -> String {
        link
            .replacingOccurrences(of: "\\", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    ResultsView(albums: [])
}
