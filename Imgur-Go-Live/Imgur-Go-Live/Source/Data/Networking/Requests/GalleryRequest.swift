//
//  GalleryRequest.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Foundation

enum GalleryRequest: ApiRequest {
    case search(dto: SearchDto)
    
    var path: String {
        switch self {
        case .search(let dto):
            return "/3/gallery/search?q_all=\(dto.query)&q_type=\(dto.type)"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
}
