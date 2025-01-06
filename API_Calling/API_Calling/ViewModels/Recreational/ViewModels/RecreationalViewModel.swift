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
    @Published var state: LoadingState      = .none
    @Published var recreationalPlayers      : [RecreationalPlayerModel] = []

    // Private variables used inside the class only
    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    private let requestBuilder              : APIRequestBuilderDelegate
    
    // innitializer
    init(apiService: APIServiceDelegate , requestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.requestBuilder = requestBuilder
    }
    
    // fetching recreational players
    func fetchRecreationalPlayers(){

        // updating state
        self.state = .loading
        
        // building request
        guard let urlRequest = self.requestBuilder
            .build() else{
            return
        }
        
        // api data fetch call
        apiService.fetchData(request: urlRequest)
            .sink(receiveCompletion: { [weak self] completion   in
                // updating state
                self?.state = .loaded
                
                switch completion {
                case .finished:
                    debugPrint("Successfully fetched recreational users.")
                case .failure(let error):
                    debugPrint("Failed with error: \(error)")
                    // updating state
                    self?.state = .error(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (recreationalPlayers: [RecreationalPlayerModel]) in
                // updating players array to update in view
                self?.recreationalPlayers = recreationalPlayers
            }).store(in: &cancellables)
    }
    
}
