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
            // Documenation: https://apidocs.imgur.com/#3c981acf-47aa-488f-b068-269f65aee3ce
            return "/3/gallery/search/?q_all=\(dto.query)&q_type=jpg"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
}
