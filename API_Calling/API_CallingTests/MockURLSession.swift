//
//  MockURLSession.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Combine
import Foundation

class MockURLSession: URLSessionProtocol {
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: URLError?
    
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        if let error = mockError {
            return Fail(error: error).eraseToAnyPublisher()
        }
        guard let data = mockData, let response = mockResponse else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
        return Just((data: data, response: response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}



