//
//  RecreationalVM.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

enum LoadingState : Equatable {
    case loading
    case error(String)
    case loaded
    case none
}

class RecreationalVM : ObservableObject {
    @Published var state: LoadingState      = .none
    @Published var recreationalPlayers      : [RecreationalPlayersModel] = []

    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    let requestBuilder                      : APIRequestBuilderDelegate

    var method : HTTPMethod = .get
    
    init(apiService: APIServiceDelegate , requestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.requestBuilder = requestBuilder
    }
    
    
    func fetchRecreationalPlayers(){

        self.state = .loading
        
        guard let urlRequest = self.requestBuilder
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
            }, receiveValue: { [weak self] (recreationalPlayers: [RecreationalPlayersModel]) in
                self?.recreationalPlayers = recreationalPlayers
            }).store(in: &cancellables)
    }
    
}
