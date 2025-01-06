//
//  JSONFetcherDelegate.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

protocol JSONFetcherDelegate{
    func fetchJson<T: Decodable>(from fileName: String, as type: T.Type) throws -> T
}
