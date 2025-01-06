//
//  AdvancedViewModel.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class AdvancedViewModel : ObservableObject {
    @Published var state: LoadingState      = .none
    @Published var advancedPlayers          : [AdvancedPlayersModel] = []

    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    let urlRequestBuilder                  : APIRequestBuilderDelegate
    init(apiService: APIServiceDelegate , urlRequestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.urlRequestBuilder = urlRequestBuilder
    }
    
    

    func fetchAdvancedPlayers(){
        
        self.state = .loading
        
        guard let urlRequest = self.urlRequestBuilder
            .build() else{
            return
        }
        
        apiService.fetch(request: urlRequest)
            .sink(receiveCompletion: { [weak self] completion   in
                self?.state = .loaded
                switch completion {
                case .finished:
                    debugPrint("Successfully fetched recreational users.")
                case .failure(let error):
                    debugPrint("Failed with error: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (advancedPlayers: [AdvancedPlayersModel]) in
                self?.advancedPlayers = advancedPlayers
            }).store(in: &cancellables)
    }
    
}
