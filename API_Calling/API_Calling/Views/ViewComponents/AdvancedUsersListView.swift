//
//  AdvancedUsersListView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct AdvancedUsersListView: View {
    let advancedPlayerList: [AdvancedPlayerModel]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(advancedPlayerList) { player in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(player.name)
                            .font(.headline)
                        Text(player.phone)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    
                }
                .padding(.horizontal)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    AdvancedUsersListView(advancedPlayerList: AdvancedMockData(jsonFetcher: JSONFetcher()).mockUserList)
}
