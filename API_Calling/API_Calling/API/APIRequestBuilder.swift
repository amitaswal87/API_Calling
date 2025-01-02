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

//enum APIEndpoints {
//    case fetchRecreationalPlayers
//    case fetchProPlayers
//    case custom(String)
//    
//    var path: String {
//        switch self {
//        case .fetchRecreationalPlayers:
//            return "/requestRecreationalPlayers"
//        case .fetchProPlayers:
//            return "/requestProUser"
//        case .custom(let customEndPoint):
//            return customEndPoint
//        }
//    }
//}
class APIRequestBuilder: APIRequestBuilderDelegate {
    private var urlComponents       : URLComponents
    private var httpMethod          : HTTPMethod            = HTTPMethod.get
//    private var apiEndPoints        : APIEndpoints?
    private var headers             : [String: String]  = [:]
    private var body                : Data?
    private var path                : String?
    init(baseURL: String) {
        self.urlComponents = URLComponents(string: baseURL)!
    }

//    init(baseURL: String) throws {
//            guard let components = URLComponents(string: baseURL) else {
//                throw URLError(.badURL)
//            }
//            self.urlComponents = components
//        }
    
    func setPath(_ path: String) -> Self {
        self.path = path
        urlComponents.path = path
        return self
    }

    func setMethod(_ method: HTTPMethod) -> Self {
        self.httpMethod = method
        return self
    }

    func addHeader(field: String, value: String) -> Self {
        headers[field] = value
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
