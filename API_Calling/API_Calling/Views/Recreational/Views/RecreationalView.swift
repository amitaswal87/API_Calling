//
//  RecreationalView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI


struct RecreationalView: View {

    @StateObject private var viewModel : RecreationalViewModel
    
    init(viewModel: RecreationalViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
       var body: some View {
           VStack {
               
               switch viewModel.state {
               case .loading:
                   ProgressView("Loading")
                       .padding()
               case .error(let error):
                   Text(error)
                       .foregroundColor(.red)
                       .padding()
               case .loaded:
                   RecreationalListView(users: viewModel.recreationalPlayers)
               default:
                   EmptyView()
               }
           }
           .navigationTitle("Recreational View")
           .onAppear {
               viewModel.fetchRecreationalPlayers()
           }
       }
}

#Preview {
    RecreationalView(viewModel: RecreationalViewModel(apiService:  APIService(urlSession: URLSession.shared), requestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL)
        .setPath(APIEndpoints.fetchRecreationalPlayers.path)))
}
