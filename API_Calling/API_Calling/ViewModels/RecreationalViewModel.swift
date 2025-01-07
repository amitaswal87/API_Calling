//
//  RecreationalViewModel.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class RecreationalViewModel : ObservableObject {
    
    // Published properties to notify changes to view
    @Published var loadingState: LoadingState       = .none
    @Published var recreationalPlayerList           : [RecreationalPlayerModel] = []
    // Private variables used inside the class only
    private var subscriptions                       = Set<AnyCancellable>()
    private let apiClient                           : APIServiceProtocol
    // public
    let apiRequestBuilder                           : APIRequestBuilderProtocol
    
    //MARK: innitializer
    init(apiClient: APIServiceProtocol , apiRequestBuilder : APIRequestBuilderProtocol) {
        self.apiClient = apiClient
        self.apiRequestBuilder = apiRequestBuilder
    }
    
    //MARK: Fetching recreational players
    func fetchRecreationalPlayers(){
        
        // updating state
        self.loadingState = .loading
        // building request
        guard let urlRequest = self.apiRequestBuilder
            .build() else{
            return
        }
        // api data fetch call
        apiClient.fetchData(request: urlRequest)
            .sink(receiveCompletion: { [weak self] completion   in
                // updating state
                self?.loadingState = .loaded
                
                switch completion {
                case .finished:
                    debugPrint("Successfully fetched recreational users.")
                case .failure(let error):
                    debugPrint("Failed with error: \(error)")
                    // updating state
                    self?.loadingState = .error(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (recreationalPlayerList: [RecreationalPlayerModel]) in
                // updating players array to update in view
                self?.recreationalPlayerList = recreationalPlayerList
            }).store(in: &subscriptions)
    }
    
}
