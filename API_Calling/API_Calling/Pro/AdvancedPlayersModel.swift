//
//  AdvancedPlayersModel.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation

// MARK: - Advanced User Model
struct AdvancedUsers: Identifiable, Codable ,Equatable {
    let id: Int
    let name: String
    let username: String
    let phone: String
}
