//
//  AdvancedVMTests.swift
//  API_CallingTests
//
//  Created by apple  on 02/01/25.
//

import Foundation
import XCTest
@testable import API_Calling
import Combine




class AdvancedVMTests: XCTestCase {
    private var advancedViewModel: AdvancedViewModel!
    private var apiService: APIService!
    private var subscription: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        apiService = APIService(urlSession: URLSession.shared)
        advancedViewModel = AdvancedViewModel(apiClient: APIService(urlSession: URLSession.shared) ,  apiRequestBuilder: APIRequestBuilder(baseURL: BaseURLProviderFactory.provider(for: .test).baseURL))
        subscription = []
    }
    
    override func tearDown() {
        advancedViewModel = nil
        apiService = nil
        subscription = nil
        super.tearDown()
    }
    
    // test innitial setup
    func testInitialState() {
        XCTAssertTrue(advancedViewModel.advancedPlayerList.isEmpty)
        XCTAssertFalse(advancedViewModel.loadingState == .loading)
    }
    
    // test if data coming from server is correct
    func testFetchAdvancedPlayersSuccess() {
        // Mock response
        let mockUserList = AdvancedMockData(jsonFetcher: JSONFetcher()).mockUserList
        
        _ = advancedViewModel.apiRequestBuilder.setPath(APIEndpoints.fetchAdvancedPlayers.path)
        
        let expectation = self.expectation(description: "Fetch users successfully")
        
        advancedViewModel.$advancedPlayerList
            .dropFirst()
            .sink { users in
                XCTAssertEqual(users, mockUserList)
                expectation.fulfill()
            }.store(in: &subscription)
        
        advancedViewModel.fetchAdvancedPlayers()
        
        waitForExpectations(timeout: 3.0)
    }
    // test failure case
    func testFetchAdvancedPlayersFailure(){
        
        let expectation = self.expectation(description: "Fetch users failure")
        
        _ = advancedViewModel.apiRequestBuilder.setPath(APIEndpoints.custom("/custom").path)
        advancedViewModel.$loadingState
            .dropFirst()
            .sink { loadingState in
                if case .error(let errorMessage) = loadingState {
                    XCTAssertEqual(errorMessage, "The data couldn’t be read because it isn’t in the correct format.")
                    expectation.fulfill()
                }
            }
            .store(in: &subscription)
        
        advancedViewModel.fetchAdvancedPlayers()
        
        waitForExpectations(timeout: 3.0)
    }
 
    
}


