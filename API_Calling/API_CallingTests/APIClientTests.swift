//
//  APIClientTests.swift
//  API_CallingTests
//
//  Created by apple  on 06/01/25.
//

import XCTest
import Combine


import Foundation

final class APIClientTests: XCTestCase {

    private var subscription: Set<AnyCancellable>!
    private var apiService : APIService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        subscription = []
        apiService =  APIService(urlSession: makeMockSession())

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscription = nil
        apiService =  nil
        super.tearDown()
    }

    func makeMockSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
    func testAPIServiceSuccess() {
        let expectation = self.expectation(description: "Fetch data successfully")

        MockURLProtocol.requestHandler = { request in
               let mockData = """
                 [
                   {
                     "id": 1,
                     "name": "Amit Pro",
                     "username": "amitProUser",
                     "phone": "123456789"
                   },
                   {
                     "id": 2,
                     "name": "Nikhil Pro",
                     "username": "nikhilProUser",
                     "phone": "234567891"
                   }]
               """.data(using: .utf8)!
               let response = HTTPURLResponse(
                   url: request.url!,
                   statusCode: 200,
                   httpVersion: nil,
                   headerFields: nil
               )!
               return (response, mockData)
           }
        
        let urlRequest = URLRequest(url: URL(string: "https://test.com/success")!)

        apiService.fetchData(request: urlRequest)
            .sink(receiveCompletion: { completion   in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    debugPrint("Failed with error: \(error)")
                    if case .failure(let error) = completion {
                        XCTFail("Unexpected failure: \(error)")
                    }
                }
            }, receiveValue: { (data: [AdvancedPlayerModel]) in
                // updating players array to update in view
                debugPrint("Success")
                XCTAssertNotNil(data)
                expectation.fulfill()
            }).store(in: &subscription)
        
        waitForExpectations(timeout: 3.0)
    }

    func testAPIServiceFailure() {
        let expectation = self.expectation(description: "Fetch data error")

        MockURLProtocol.requestHandler = { request in
               let response = HTTPURLResponse(
                   url: request.url!,
                   statusCode: 404,
                   httpVersion: nil,
                   headerFields: nil
               )!
               return (response, nil)
           }
        
        let urlRequest = URLRequest(url: URL(string: "https://test.com/fail")!)

        apiService.fetchData(request: urlRequest)
            .sink(receiveCompletion: { completion   in
                switch completion {
                case .finished:
                    XCTFail("Unexpected failure.")
                case .failure(let error):
                    debugPrint("successfully failed")
                    if case .failure( _) = completion {
                        expectation.fulfill()
                    }
                }
            }, receiveValue: { (data: [AdvancedPlayerModel]) in
                // updating players array to update in view
                XCTFail("Unexpected failure.")
            }).store(in: &subscription)
        
        waitForExpectations(timeout: 3.0)
    }
}
