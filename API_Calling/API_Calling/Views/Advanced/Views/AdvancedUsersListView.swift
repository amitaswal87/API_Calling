//
//  AdvancedUsersListView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct AdvancedUsersListView: View {
    let users: [AdvancedPlayerModel]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.phone)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    
                }
            }
        }
    }
}

#Preview {
    AdvancedUsersListView(users: AdvancedMockData(jsonFetcher: JSONFetcher()).mockUsers)
}
