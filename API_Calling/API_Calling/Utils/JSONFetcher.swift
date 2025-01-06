//
//  JSONFetcher.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation
enum JSONFetchError: Error {
    case fileNotFound
    case decodingFailed
}

class JSONFetcher : JSONFetcherDelegate{
    /// Fetches JSON data from a file and decodes it into the specified model type.
    static func fetchJson<T: Decodable>(from fileName: String, as type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
               print("File not found")
            throw JSONFetchError.fileNotFound
           }
           
           do {
               let data = try Data(contentsOf: url)
               let decodedData = try JSONDecoder().decode(T.self, from: data)
               return decodedData
           } catch {
               print("Error decoding JSON: \(error)")
               throw JSONFetchError.decodingFailed
           }
    }
}
