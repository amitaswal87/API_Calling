//
//  URLSessionMockTests.swift
//  API_CallingTests
//
//  Created by apple  on 06/01/25.
//

import XCTest
import Combine


import Foundation

final class URLSessionMockTests: XCTestCase {
    
    private var subscription: Set<AnyCancellable>!
    private var apiService : APIService!
    private var mockSession : MockURLSession!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        subscription = []
        mockSession = MockURLSession()
        apiService =  APIService(urlSession: mockSession)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscription = nil
        mockSession = nil
        apiService =  nil
        super.tearDown()
    }
    
    func testAPIServiceSuccess() {
        // Given
        let mockData = """
        [
                {
                    "id": 1,
                    "name": "Amit Pro",
                    "username": "amitProUser",
                    "phone": "123456789",
                    "address": {
                        "city": "Mumbai",
                        "state": "Maharashtra"
                    }
                }
        ]
        """.data(using: .utf8)
        let mockResponse = HTTPURLResponse(url: URL(string: "https://mockdata.com/testSuccess")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)
        mockSession.mockData = mockData
        mockSession.mockResponse = mockResponse
        let request = URLRequest(url: URL(string: "https://mockdata.com/testSuccess")!)
        let expectation = XCTestExpectation(description: "FetchData completes")
        
        apiService.fetchData(request: request)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got failure: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { (result: [AdvancedPlayerModel]) in
                XCTAssertEqual(result.count, 1)
            })
            .store(in: &self.subscription)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testAPIServiceFailure(){
        // Given
        mockSession.mockError = URLError(.timedOut) // Simulate a timeout error
        let apiService = APIService(urlSession: mockSession)
        let request = URLRequest(url: URL(string: "https://mockdata.com/testFailure")!)
        let expectation = XCTestExpectation(description: "FetchData fails")
        
        apiService.fetchData(request: request)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure but got success.")
                case .failure(let error):
                    // Verify the error
                    XCTAssertEqual(error as? URLError, URLError(.timedOut))
                }
                expectation.fulfill()
            }, receiveValue: { (result: [AdvancedPlayerModel]) in
                XCTFail("Expected failure but got data: \(result)")
            })
            .store(in: &self.subscription)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
