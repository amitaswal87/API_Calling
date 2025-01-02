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
            AdvancedUsers(id: 1, name: "Amit Pro",      username: "amitProUser",    phone: "123456789"),
            AdvancedUsers(id: 2, name: "Nikhil Pro",    username: "nikhilProUser",  phone: "234567891"),
            AdvancedUsers(id: 3, name: "Jim Pro",       username: "jimProUser",     phone: "345678912"),
            AdvancedUsers(id: 4, name: "Kim Pro",       username: "kimProUser",     phone: "456789123"),
            AdvancedUsers(id: 5, name: "Reda Pro",      username: "redaProUser",    phone: "567891234")
            
        ]
    }
}
