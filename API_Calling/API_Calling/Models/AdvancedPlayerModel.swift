//
//  AdvancedPlayerModel.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation


// MARK: - Advanced User Model
struct AdvancedPlayerModel: Identifiable, Decodable ,Equatable {
    let id: Int
    let name: String
    let username: String
    let phone: String
    let address: AddressWithState
}
// Define the Address model
struct AddressWithState: Decodable ,Equatable {
    let city: String
    let state: String
}
