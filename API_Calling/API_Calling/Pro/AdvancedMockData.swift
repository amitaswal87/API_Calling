//
//  AdvancedMockData.swift
//  API_Calling
//
//  Created by apple  on 02/01/25.
//

import Foundation

// Create a separate struct or class to handle mock data for testing
struct AdvancedPlayersMockData {
    static func getMockUsers() -> [AdvancedUsers] {
        return [
            AdvancedUsers(id: 1, name: "Pro 1", username: "proUser1", phone: "123456789"),
            AdvancedUsers(id: 2, name: "Pro 2", username: "proUser2", phone: "234567891"),
            AdvancedUsers(id: 3, name: "Pro 3", username: "proUser3", phone: "345678912")
        ]
    }
}
