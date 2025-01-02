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
    private var viewModel: AdvancedVM!
    private var apiService: APIService!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        apiService = APIService(urlSession: URLSession.shared)
        viewModel = AdvancedVM(apiService: APIService(urlSession: URLSession.shared) ,  urlRequestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL))
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        apiService = nil
        cancellables = nil
        super.tearDown()
    }
    
    // test innitial setup
    func testInitialState() {
        XCTAssertTrue(viewModel.advancedPlayers.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    // test if data coming from server is correct
    func testFetchRecreationalPlayersSuccess() {
        // Mock response
        let mockUsers = AdvancedPlayersMockData.getMockUsers()
        _ = viewModel.urlRequestBuilder.setPath(APIEndpoints.fetchAdvancedPlayers.path)

        let expectation = self.expectation(description: "Fetch users successfully")
        
        viewModel.$advancedPlayers
            .dropFirst()
            .sink { users in
                XCTAssertEqual(users, mockUsers)
                expectation.fulfill()
            }.store(in: &cancellables)
        
        viewModel.fetchAdvancedPlayers()
        
        waitForExpectations(timeout: 3.0)
    }
    // test failure case
    func testFetchRecreationalPlayersFailure(){
        
        let expectation = self.expectation(description: "Fetch users failure")
        
        _ = viewModel.urlRequestBuilder.setPath(APIEndpoints.custom("/custom").path)
        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "The data couldn’t be read because it isn’t in the correct format.")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchAdvancedPlayers()

        waitForExpectations(timeout: 3.0)
    }
}
