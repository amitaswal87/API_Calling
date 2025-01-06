//
//  APIService.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class APIService: APIServiceDelegate {
    private let urlSession: URLSession

    // url session
    init(urlSession: URLSession) {
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
