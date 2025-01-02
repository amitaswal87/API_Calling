//
//  AdvancedView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct AdvancedView: View {
    @StateObject private var viewModel : AdvancedVM

    init(viewModel: AdvancedVM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else {
                AdvancedUsersListView(users: viewModel.advancedPlayers)
            }
        }
        .navigationTitle("Advanced View") 
        .onAppear {
            viewModel.fetchAdvancedPlayers()
        }
    }
}

#Preview {
    AdvancedView(viewModel: AdvancedVM(apiService:  APIService(urlSession: URLSession.shared)))
}
