//
//  RecreationalViewModelTests.swift
//  API_CallingTests
//
//  Created by apple  on 06/01/25.
//

import XCTest

import Foundation
import XCTest
@testable import API_Calling
import Combine

class RecreationalViewModelTests: XCTestCase {
    private var recreationalViewModel: RecreationalViewModel!
    private var mockAPIService: APIService!
    private var cancellables: Set<AnyCancellable>!
    override func setUp() {
        super.setUp()
        mockAPIService = APIService(urlSession: URLSessionAdapter(session: .shared))
        recreationalViewModel = RecreationalViewModel(apiClient: mockAPIService, apiRequestBuilder: APIRequestBuilder(baseURL: BaseURLProviderFactory.provider(for: .test).baseURL))
        cancellables = []
    }
    
    override func tearDown() {
        recreationalViewModel = nil
        mockAPIService = nil
        cancellables = nil
        super.tearDown()
    }
    
    // test innitial setup
    func testInitialState() {
        XCTAssertTrue(recreationalViewModel.recreationalPlayerList.isEmpty)
        XCTAssertFalse(recreationalViewModel.loadingState == .loading)
    }
    
    // test if data coming from server is correct
    func testFetchRecreationalPlayersSuccess() {
        // Mock response
        let mockUserList = RecreationalMockDataProvider(playerJsonFetcher: JSONFetcher()).mockUserList
        let expectation = self.expectation(description: "Fetch users successfully")
        _ = recreationalViewModel.apiRequestBuilder.setPath(APIEndpoints.fetchRecreationalPlayers.path)
        recreationalViewModel.$recreationalPlayerList
            .dropFirst()
            .sink { users in
                // compare
                XCTAssertEqual(users, mockUserList)
                // fulfill
                expectation.fulfill()
            }
            .store(in: &cancellables)
        recreationalViewModel.fetchRecreationalPlayers()
        waitForExpectations(timeout: 3.0)
    }
    
    // test failure case
    func testFetchRecreationalPlayersFailure() {
        
        let expectation = self.expectation(description: "Fetch users failure")
        _ = recreationalViewModel.apiRequestBuilder.setPath(APIEndpoints.custom("/custom").path)
        recreationalViewModel.$loadingState
            .dropFirst()
            .sink { loadingState in
                // compare
                if case .error(let errorMessage) = loadingState {
                    XCTAssertEqual(errorMessage, "The data couldn’t be read because it isn’t in the correct format.")
                    // fulfill
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        recreationalViewModel.fetchRecreationalPlayers()
        waitForExpectations(timeout: 3.0)
    }
}

