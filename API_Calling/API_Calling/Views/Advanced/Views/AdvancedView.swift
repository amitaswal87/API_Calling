//
//  AdvancedView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct AdvancedView: View {
    @StateObject private var advancedViewModel : AdvancedViewModel

    init(advancedViewModel: AdvancedViewModel) {
        _advancedViewModel = StateObject(wrappedValue: advancedViewModel)
    }
    var body: some View {
        VStack {
            switch self.advancedViewModel.state {
            case .loading:
                ProgressView("Loading")
                    .padding()
            case .error(let error):
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            case .loaded:
                AdvancedUsersListView(users: self.advancedViewModel.advancedPlayers)
            default:
                EmptyView()
            }
        }
        // setting navigation title
        .navigationTitle("Advanced View")
        .onAppear {
            // calling fetch api data method on appear of the view
            advancedViewModel.fetchAdvancedPlayers()
        }
    }
}

#Preview {
    AdvancedView(advancedViewModel: AdvancedViewModel(apiService: APIService(urlSession: URLSession.shared) ,  urlRequestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL).setPath((APIEndpoints.fetchAdvancedPlayers.path))))
}
