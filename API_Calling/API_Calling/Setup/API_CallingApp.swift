//
//  API_CallingApp.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

@main
struct API_CallingApp: App {
    var body: some Scene {
        WindowGroup {
            let apiClient = APIService(urlSession: URLSession.shared)
            
            let landingViewModel = LandingViewModel(apiClient: apiClient)
            LandingView(landingViewModel: landingViewModel)
        }
    }
}
