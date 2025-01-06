//
//  AdvancedView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct AdvancedView: View {
    @StateObject private var advancedViewModel : AdvancedVM

    init(advancedViewModel: AdvancedVM) {
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
        .navigationTitle("Advanced View") 
        .onAppear {
            advancedViewModel.fetchAdvancedPlayers()
        }
    }
}

#Preview {
    AdvancedView(advancedViewModel: AdvancedVM(apiService: APIService(urlSession: URLSession.shared) ,  urlRequestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL).setPath((APIEndpoints.fetchAdvancedPlayers.path))))
}
