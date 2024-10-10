//
//  SearchResponse.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Foundation

struct SearchResponse: Decodable {
    let data: [ImgurAlbum]
}

struct ImgurAlbum: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let images: [ImgurImage]
}

struct ImgurImage: Codable, Hashable, Identifiable {
    let id: String
    let title: String?
    let description: String?
    let link: String
}
