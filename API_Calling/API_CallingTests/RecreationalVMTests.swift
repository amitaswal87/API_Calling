//
//  ViewModelTests.swift
//  API_CallingTests
//
//  Created by apple  on 26/12/24.
//

import Foundation
import XCTest
@testable import API_Calling
import Combine

class RecreationalVMTests: XCTestCase {
    private var viewModel: RecreationalVM!
    private var mockAPIService: APIService!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockAPIService = APIService(urlSession: URLSession.shared)
        viewModel = RecreationalVM(apiService: mockAPIService, requestBuilder: APIRequestBuilder(baseURL: TestBaseURLProvider().baseURL))
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockAPIService = nil
        cancellables = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertTrue(viewModel.recreationalPlayers.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchRecreationalPlayersSuccess() {
        // Mock response
        let mockUsers = RecreationalPlayersMockData.getMockUsers()

        let expectation = self.expectation(description: "Fetch users successfully")

        viewModel.$recreationalPlayers
            .dropFirst()
            .sink { users in
                XCTAssertEqual(users, mockUsers)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchRecreationalPlayers()

        waitForExpectations(timeout: 3.0)
    }

    func testFetchRecreationalPlayersFailure() {

        let expectation = self.expectation(description: "Fetch users failure")
        
        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "The data couldn’t be read because it isn’t in the correct format.")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchRecreationalPlayers(endPoint: "/custom")

        waitForExpectations(timeout: 3.0)
    }
}
