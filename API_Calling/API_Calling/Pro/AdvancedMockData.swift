//
//  AdvancedMockData.swift
//  API_Calling
//
//  Created by apple  on 02/01/25.
//

import Foundation

// Create a separate struct or class to handle mock data for testing coming from json
struct AdvancedMockData {
    static var mockUsers: [AdvancedPlayersModel] {
        do {
            return try JSONFetcher.fetchJson(from: "AdvancedPlayersMockData", as: [AdvancedPlayersModel].self)
        } catch JSONFetchError.fileNotFound {
            print("Error: The JSON file was not found.")
        } catch JSONFetchError.decodingFailed {
            print("Error: Failed to decode the JSON data.")
        } catch {
            print("An unexpected error occurred: \(error)")
        }
        return [] // Return an empty array in case of an error
    }
}
