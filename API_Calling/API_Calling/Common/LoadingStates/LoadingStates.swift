//
//  LoadingStates.swift
//  API_Calling
//
//  Created by apple  on 06/01/25.
//

import Foundation

// loading states of views
enum LoadingState : Equatable {
    case loading
    case error(String)
    case loaded
    case none
}
