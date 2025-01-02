//
//  RecreationalPlayersModel.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation

// MARK: - Recreational User Model
struct RecreationalUser: Identifiable, Codable , Equatable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
