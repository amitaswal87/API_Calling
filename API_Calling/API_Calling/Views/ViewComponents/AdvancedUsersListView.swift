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
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(player.name)
                                .font(.headline)
                            Text(player.phone)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {
                            Text(player.address.city)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(player.address.state)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(alignment: .trailing)
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
    AdvancedUsersListView(advancedPlayerList: AdvancedMockDataProvider(playerJsonFetcher: JSONFetcher()).mockUserList)
}
