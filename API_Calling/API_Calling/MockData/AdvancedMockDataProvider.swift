//
//  AdvancedMockDataProvider.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation


// Create a separate struct or class to handle mock data for testing coming from json
struct AdvancedMockDataProvider {
    let playerJsonFetcher : JSONFetcherProtocol
    var mockUserList: [AdvancedPlayerModel] {
        do {
            return try playerJsonFetcher.fetchJson(from: "AdvancedPlayersMockData", as: [AdvancedPlayerModel].self)
        } catch JSONFetchError.fileNotFound {
            debugPrint("Error: The JSON file was not found.")
        } catch JSONFetchError.decodingFailed {
            debugPrint("Error: Failed to decode the JSON data.")
        } catch {
            debugPrint("An unexpected error occurred: \(error)")
        }
        return [] // Return an empty array in case of an error
    }
}
