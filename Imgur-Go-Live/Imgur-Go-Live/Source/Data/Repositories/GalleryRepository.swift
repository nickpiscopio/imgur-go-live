//
//  GalleryRepository.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Combine
import Foundation

protocol GalleryRepositoryProtocol {
    func search(dto: SearchDto) async throws -> SearchResponse
}

class GalleryRepository: GalleryRepositoryProtocol {
    let networkSession: any NetworkSessionProtocol
    let endpoint = GalleryRequest.self
    
    public init(session: any NetworkSessionProtocol = NetworkSession()) {
        self.networkSession = session
    }
        
    func search(dto: SearchDto) async throws -> SearchResponse {
        try await networkSession.request(endpoint.search(dto: dto))
    }
}
