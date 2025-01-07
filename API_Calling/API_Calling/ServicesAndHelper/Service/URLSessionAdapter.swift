//
//  URLSessionAdapter.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Foundation
import Combine

class URLSessionAdapter: URLSessionProtocol {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return session.dataTaskPublisher(for: request)
            .mapError { $0 as URLError } // Ensure errors conform to the protocol
            .eraseToAnyPublisher()
    }
}
