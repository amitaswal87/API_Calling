//
//  TestBaseURLProvider.swift
//  API_Calling
//
//  Created by apple  on 27/12/24.
//

import Foundation


// provides bas url for test environment, when required for prod and UAT can also be created
struct TestBaseURLProvider: BaseURLProviderDelegate {
    var baseURL: String {
        return "https://e13a8e84-b781-4461-a633-8dd4b6494237.mock.pstmn.io"
    }
}
