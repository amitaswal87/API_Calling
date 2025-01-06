//
//  AdvancedViewModel.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class AdvancedViewModel : ObservableObject {
    
    // Published properties to notify changes to view
    @Published var state: LoadingState      = .none
    @Published var advancedPlayers          : [AdvancedPlayerModel] = []

    // Private variables used inside the class only
    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    private let urlRequestBuilder           : APIRequestBuilderDelegate
    
    // innitializer
    init(apiService: APIServiceDelegate , urlRequestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.urlRequestBuilder = urlRequestBuilder
    }

    // fetching advanced players
    func fetchAdvancedPlayers(){
        
        // updating state
        self.state = .loading

        guard let urlRequest = self.urlRequestBuilder
            .build() else{
            return
        }
        
        // fetch service called
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
            }, receiveValue: { [weak self] (advancedPlayers: [AdvancedPlayerModel]) in
                // updating players array to update in view
                self?.advancedPlayers = advancedPlayers
            }).store(in: &cancellables)
    }
    
}
