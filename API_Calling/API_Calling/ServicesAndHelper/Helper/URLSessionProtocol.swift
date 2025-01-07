//
//  URLSessionProtocol.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Foundation
import Combine

protocol URLSessionProtocol {
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}
