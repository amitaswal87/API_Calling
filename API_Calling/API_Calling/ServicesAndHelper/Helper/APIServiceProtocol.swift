//
//  APIServiceProtocol.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Foundation
import Combine

protocol APIServiceProtocol{
    func fetchData<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error>
}
