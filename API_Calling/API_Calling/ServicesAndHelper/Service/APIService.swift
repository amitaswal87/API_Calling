//
//  APIService.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class APIService: APIServiceProtocol {
    private let urlSession: URLSessionProtocol
    
    // url session
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    // fetch api response
    func fetchData<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        return urlSession.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
