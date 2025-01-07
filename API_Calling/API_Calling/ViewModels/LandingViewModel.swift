//
//  LandingViewModel.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

class LandingViewModel: ObservableObject {
    
    private let apiClient       : APIServiceProtocol
    private let urlProvider     = BaseURLProviderFactory.provider(for: .test)
    
    //MARK: Initializer
    init(apiClient: APIServiceProtocol) {
        self.apiClient = apiClient
    }
    
    //MARK: create recreational viewModel
    func makeRecreationalViewModel() -> RecreationalViewModel {
        let apiRecreationalRequestBuilder = APIRequestBuilder(baseURL: urlProvider.baseURL)
            .setPath(APIEndpoints.fetchRecreationalPlayers.path)
        return RecreationalViewModel(apiClient: self.apiClient, apiRequestBuilder: apiRecreationalRequestBuilder)
    }
    
    //MARK: create advanced viewModel
    func makeAdvancedViewModel() -> AdvancedViewModel {
        let apiAdvancedRequestBuilder = APIRequestBuilder(baseURL:urlProvider.baseURL)
            .setPath(APIEndpoints.fetchAdvancedPlayers.path)
        return AdvancedViewModel(apiClient: self.apiClient, apiRequestBuilder: apiAdvancedRequestBuilder)
    }
}
