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
                    
                    // create recreational view / vm
                    let recreationalVm = RecreationalVM(apiService: APIService(urlSession: URLSession.shared), requestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL))
                    
                    NavigationLink(destination: RecreationalView(viewModel:recreationalVm )) {
                        Text("Recreational Players")
                    }
                    .buttonStyle(PrimaryButtonStyle(backgroundColor: .black))
                    
                    
                    // create advanced view / vm
                    let advancedVm = AdvancedVM(apiService: APIService(urlSession: URLSession.shared) ,  urlRequestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL))
                    
                    NavigationLink(destination: AdvancedView(viewModel: advancedVm)) {
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
