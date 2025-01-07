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
            // Creating api client and landingViewModel and passing to landingView
            let apiClient = APIService(urlSession: URLSessionAdapter(session: .shared))
            let landingViewModel = LandingViewModel(apiClient: apiClient)
            LandingView(landingViewModel: landingViewModel)
        }
    }
}
