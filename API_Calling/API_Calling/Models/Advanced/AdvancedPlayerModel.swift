//
//  AdvancedPlayerModel.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

// MARK: - Advanced User Model
struct AdvancedPlayerModel: Identifiable, Codable ,Equatable {
    let id: Int
    let name: String
    let username: String
    let phone: String
}
