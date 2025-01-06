//
//  RecreationalView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI


struct RecreationalView: View {

    @StateObject private var recreationalViewModel : RecreationalViewModel
    
    init(recreationalViewModel: RecreationalViewModel) {
        _recreationalViewModel = StateObject(wrappedValue: recreationalViewModel)
    }
    
       var body: some View {
           VStack {
               
               switch recreationalViewModel.loadingState {
               case .loading:
                   ProgressView("Loading")
                       .padding()
               case .error(let error):
                   Text(error)
                       .foregroundColor(.red)
                       .padding()
               case .loaded:
                   RecreationalListView(recreationalPlayerList: recreationalViewModel.recreationalPlayerList)
               default:
                   EmptyView()
               }
           }
           // setting navigation title
           .navigationTitle("Recreational View")
           .onAppear {
               // calling fetch api data method on appear of the view
               recreationalViewModel.fetchRecreationalPlayers()
           }
       }
}

#Preview {
    RecreationalView(recreationalViewModel: RecreationalViewModel(apiClient:  APIService(urlSession: URLSession.shared), apiRequestBuilder: APIRequestBuilder(baseURL: BaseURLProviderFactory.provider(for: .test).baseURL)
        .setPath(APIEndpoints.fetchRecreationalPlayers.path)))
}
