//
//  APIRequestBuilderProtocol.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Foundation

protocol APIRequestBuilderProtocol {
    func setPath(_ path: String) -> Self
    func setMethod(_ method: HTTPMethod) -> Self
    func addHeader(field: String, value: String) -> Self
    func setBody(_ body: Data?) -> Self
    func build() -> URLRequest?
}
