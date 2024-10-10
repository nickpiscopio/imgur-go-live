//
//  ApiRequest.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Foundation

protocol ApiRequest {
    var path: String { get }
    var method: HttpMethod { get }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
