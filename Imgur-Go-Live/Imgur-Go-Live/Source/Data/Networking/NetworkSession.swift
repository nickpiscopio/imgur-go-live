//
//  NetworkSession.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Combine
import Foundation

protocol NetworkSessionProtocol {
    func request<ResultObject: Decodable>(_ apiRequest: ApiRequest) async throws -> ResultObject
}

class NetworkSession: NetworkSessionProtocol {
    func request<ResultObject: Decodable>(_ apiRequest: ApiRequest) async throws -> ResultObject {
        // I wouldn't actually store this here.
        // I would put this in a utility class and based on the build type, I would switch this out for a dev, staging, or prod domain.
        let domain = "https://api.imgur.com"
        let fullUrl = domain + apiRequest.path
        
        guard let url = URL(string: fullUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // This would not be saved here in a normal application.
        // I would store this is a environment variable which would be housed in a CI/CD pipeline so it doesn't get stolen.
        request.addValue("Client-ID 2d086962f60c89e", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(ResultObject.self, from: data)
        } catch {
            throw URLError(.cannotDecodeRawData)
        }
    }
}
