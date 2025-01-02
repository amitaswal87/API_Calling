//
//  RecreationalVM.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine


class RecreationalVM : ObservableObject {
    
    @Published var recreationalPlayers      : [RecreationalUser] = []
    @Published var isLoading: Bool          = false // the API call is in progress or not
    @Published var errorMessage: String?    = nil

    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    let requestBuilder              : APIRequestBuilderDelegate

    var method : HTTPMethod = .get
    
    init(apiService: APIServiceDelegate , requestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.requestBuilder = requestBuilder
    }
    
    
    func fetchRecreationalPlayers(){

        self.isLoading = true
        
        guard let urlRequest = self.requestBuilder
            .build() else{
            return
        }
        
        apiService.fetch(request: urlRequest)
            .sink(receiveCompletion: { [weak self] completion   in
                self?.isLoading = false
                switch completion {
                case .finished:
                    debugPrint("Successfully fetched recreational users.")
                case .failure(let error):
                    debugPrint("Failed with error: \(error)")
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] (recreationalPlayers: [RecreationalUser]) in
                self?.recreationalPlayers = recreationalPlayers
            }).store(in: &cancellables)
    }
    
}
