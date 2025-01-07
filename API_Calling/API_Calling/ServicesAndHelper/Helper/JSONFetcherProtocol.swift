//
//  JSONFetcherProtocol.swift
//  API_Calling
//
//  Created by apple  on 07/01/25.
//

import Foundation

protocol JSONFetcherProtocol{
    func fetchJson<T: Decodable>(from fileName: String, as type: T.Type) throws -> T
}
