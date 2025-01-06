//
//  RecreationalListView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct RecreationalListView: View {
    let recreationalPlayerList: [RecreationalPlayerModel]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(recreationalPlayerList) { player in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(player.name)
                            .font(.headline)
                        Text(player.email)
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
    RecreationalListView(recreationalPlayerList: RecreationalMockData(jsonFetcher: JSONFetcher()).mockUserList)
}
