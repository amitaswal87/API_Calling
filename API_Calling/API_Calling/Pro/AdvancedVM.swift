//
//  AdvancedVM.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import Foundation
import Combine

class AdvancedVM : ObservableObject {
    
    @Published var advancedPlayers          : [AdvancedUsers] = []
    @Published var isLoading: Bool          = false // the API call is in progress or not
    @Published var errorMessage: String?    = nil

    private var cancellables                = Set<AnyCancellable>()
    private let apiService                  : APIServiceDelegate
    let urlRequestBuilder                  : APIRequestBuilderDelegate
    init(apiService: APIServiceDelegate , urlRequestBuilder : APIRequestBuilderDelegate) {
        self.apiService = apiService
        self.urlRequestBuilder = urlRequestBuilder
    }
    
    

    func fetchAdvancedPlayers(){
        
        self.isLoading = true
        
        guard let urlRequest = self.urlRequestBuilder
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
            }, receiveValue: { [weak self] (advancedPlayers: [AdvancedUsers]) in
                self?.advancedPlayers = advancedPlayers
                print(AdvancedPlayersMockData.getMockUsers())
            }).store(in: &cancellables)
    }
    
}
