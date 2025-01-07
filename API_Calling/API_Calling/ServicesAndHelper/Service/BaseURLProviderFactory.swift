//
//  BaseURLProvider.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

enum BaseUrl {
    case test
    case prod
    
    var url: String {
        switch self {
        case .test:
            return "https://e13a8e84-b781-4461-a633-8dd4b6494237.mock.pstmn.io"
        case .prod:
            return ""
        }
    }
}


// Factory to get the appropriate provider
struct BaseURLProviderFactory {
    static func provider(for environment: BaseUrl) -> BaseURLProviderProtocol {
        switch environment {
        case .test:
            return TestBaseURLProvider()
        case .prod:
            return ProdBaseURLProvider()
        }
    }
}
