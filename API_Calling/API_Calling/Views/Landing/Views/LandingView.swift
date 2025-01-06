//
//  LandingView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI


struct LandingView: View {
    
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
                    
                    
                    // create apiBuilder object
                    let apiBuilderRecreational = APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL)
                        .setPath(APIEndpoints.fetchRecreationalPlayers.path)
                    // creat viewModel
                    let recreationalViewModel = RecreationalViewModel(apiService: APIService(urlSession: URLSession.shared), requestBuilder: apiBuilderRecreational)
                    // navigate to recreationUsers view
                    NavigationLink(destination: RecreationalView(viewModel:recreationalViewModel )) {
                        Text("Recreational Players")
                    }
                    .buttonStyle(PrimaryButtonStyle(backgroundColor: .black))
                    
                    
                    // create apiBuilder object
                    let apiBuilderAdvanced = APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL)
                        .setPath(APIEndpoints.fetchAdvancedPlayers.path)
                    // create viewModel
                    let advancedViewModel = AdvancedViewModel(apiService: APIService(urlSession: URLSession.shared) ,  urlRequestBuilder: apiBuilderAdvanced)
                    // navigate to AdvancedView
                    NavigationLink(destination: AdvancedView(advancedViewModel: advancedViewModel)) {
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
    LandingView()
}
