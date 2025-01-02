//
//  RecreationalView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI


struct RecreationalView: View {

    @StateObject private var viewModel : RecreationalVM
    
    init(viewModel: RecreationalVM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
       var body: some View {
           VStack {
               if viewModel.isLoading {
                   ProgressView("Loading")
                       .padding()
               } else if let errorMessage = viewModel.errorMessage , errorMessage.count > 0 {
                   Text(errorMessage)
                       .foregroundColor(.red)
                       .padding()
               } else {
                   RecreationalListView(users: viewModel.recreationalPlayers)
               }
           }
           .navigationTitle("Recreational View")
           .onAppear {
               viewModel.fetchRecreationalPlayers()
           }
       }
}

#Preview {
    RecreationalView(viewModel: RecreationalVM(apiService:  APIService(urlSession: URLSession.shared), requestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL)
        .setPath(APIEndpoints.fetchRecreationalPlayers.path)))
}
