//
//  RecreationalPlayerModel.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

// MARK: - Recreational User Model
struct RecreationalPlayerModel: Identifiable, Decodable , Equatable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressWithCountry
}
// Define the Address model
struct AddressWithCountry: Decodable ,Equatable {
    let city: String
    let country: String
}
