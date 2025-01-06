//
//  APIServiceDelegate.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

protocol APIServiceDelegate{
    func fetchData<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> 
}
