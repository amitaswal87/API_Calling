//
//  RecreationalMockData.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation

// Create a separate struct or class to handle mock data for testing
struct RecreationalPlayersMockData {
    static func getMockUsers() -> [RecreationalUser] {
        return [
            RecreationalUser(id: 1, name: "Amit", username: "amitUser", email: "amit@amit.com"),
            RecreationalUser(id: 2, name: "Nikhil", username: "nikhilUser", email: "nikhil@nikhil.com"),
            RecreationalUser(id: 3, name: "Jim", username: "jimUser", email: "jim@jim.com"),
            RecreationalUser(id: 4, name: "Kim", username: "kimUser", email: "kim@kim.com"),
            RecreationalUser(id: 5, name: "Reda", username: "redaUser", email: "reda@reda.com")
        ]
    }
}
