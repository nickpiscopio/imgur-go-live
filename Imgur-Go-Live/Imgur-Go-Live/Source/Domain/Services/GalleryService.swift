//
//  GalleryService.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Foundation

class GalleryService {
    var repo: GalleryRepository
    init(repo: GalleryRepository) {
        self.repo = repo
    }
    
    func search(dto: SearchDto) async throws -> SearchResponse {
        try await repo.search(dto: dto)
    }
}
