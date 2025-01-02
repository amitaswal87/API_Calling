//
//  TestBaseURLProvider.swift
//  API_Calling
//
//  Created by apple  on 27/12/24.
//

import Foundation


struct TestBaseURLProvider: BaseURLProviderDelegate {
    var baseURL: String {
//        guard let url = URL(string: "https://e13a8e84-b781-4461-a633-8dd4b6494237.mock.pstmn.io") else {
//            fatalError("Invalid Production Base URL")
//        }
        return "https://e13a8e84-b781-4461-a633-8dd4b6494237.mock.pstmn.io"
    }
}
