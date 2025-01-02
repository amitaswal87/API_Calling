//
//  APIRequestBuilderDelegate.swift
//  API_Calling
//
//  Created by apple  on 27/12/24.
//

import Foundation

protocol APIRequestBuilderDelegate {
    func setPath(_ path: String) -> Self
    func setMethod(_ method: HTTPMethod) -> Self 
    func addHeader(field: String, value: String) -> Self
    func setBody(_ body: Data?) -> Self
    func build() -> URLRequest?
}
