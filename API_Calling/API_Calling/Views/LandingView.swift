//
//  LandingView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI


struct LandingView: View {
    
    private var landingViewModel : LandingViewModel
    
    init(landingViewModel: LandingViewModel) {
        self.landingViewModel = landingViewModel
    }
    
    var body: some View {
        NavigationView {            
            
            VStack {
                // Header Text
                Text("Welcome")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                // Buttons in the center
                VStack(spacing: 20) {
                    
                    // navigate to recreationUsers view
                    NavigationLink(destination: RecreationalView(recreationalViewModel:self.landingViewModel.makeRecreationalViewModel())) {
                        Text("Recreational Players")
                    }
                    .buttonStyle(PrimaryButtonStyle(backgroundColor: .black))
                    
                    
                    // navigate to AdvancedView
                    NavigationLink(destination: AdvancedView(advancedViewModel: self.landingViewModel.makeAdvancedViewModel())) {
                        Text("Advanced Players")
                    }
                    .buttonStyle(PrimaryButtonStyle(backgroundColor: .black))
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LandingView(landingViewModel: LandingViewModel(apiClient: APIService(urlSession: URLSession.shared)))
}
