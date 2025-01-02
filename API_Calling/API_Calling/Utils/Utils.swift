//
//  Utils.swift
//  API_Calling
//
//  Created by apple  on 02/01/25.
//

import Foundation
import SwiftUI

// MARK: - Button Style
struct PrimaryButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var cornerRadius: CGFloat = 8
    var padding: CGFloat = 10

    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(cornerRadius)
            .opacity(configuration.isPressed ? 0.8 : 1.0) // Add a press effect
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Button press animation
    }
}
