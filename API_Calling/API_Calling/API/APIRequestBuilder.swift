//
//  APIRequest.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum APIEndpoints {
    case fetchRecreationalPlayers
    case fetchAdvancedPlayers
    case custom(String)
    
    var path: String {
        switch self {
        case .fetchRecreationalPlayers:
            return "/requestRecreationalPlayers"
        case .fetchAdvancedPlayers:
            return "/requestProUser"
        case .custom(let customEndPoint):
            return customEndPoint
        }
    }
}
class APIRequestBuilder: APIRequestBuilderDelegate {
    private var urlComponents       : URLComponents
    private var httpMethod          : HTTPMethod            = HTTPMethod.get
    private var headers             : [String: String]  = [:]
    private var body                : Data?
    
    
    init(baseURL: String) {
        self.urlComponents = URLComponents(string: baseURL)!
    }
    
    func setPath(_ path: String) -> Self {
        self.urlComponents.path = path
        return self
    }

    func setMethod(_ method: HTTPMethod) -> Self {
        self.httpMethod = method
        return self
    }

    func addHeader(field: String, value: String) -> Self {
        self.headers[field] = value
        return self
    }

    func setBody(_ body: Data?) -> Self {
        self.body = body
        return self
    }

    
    func build() -> URLRequest? {
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
    
//    func buildRequest(path: String, method: HTTPMethod , baseUrl : URL) -> URLRequest? {
//            guard let url = URL(string: path, relativeTo: baseUrl) else { return nil }
//            var request = URLRequest(url: url)
//            request.httpMethod = method.rawValue
//            return request
//        }
}
