//
//  RecreationalMockData.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation

// Create a separate struct or class to handle mock data for testing coming from json
struct RecreationalMockData {
    let jsonFetcher : JSONFetcherDelegate
    var mockUsers: [RecreationalPlayersModel] {
        do {
            return try jsonFetcher.fetchJson(from: "RecreationalPlayersMockData", as: [RecreationalPlayersModel].self)
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

