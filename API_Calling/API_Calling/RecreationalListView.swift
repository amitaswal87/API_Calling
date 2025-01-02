//
//  RecreationalListView.swift
//  API_Calling
//
//  Created by apple  on 26/12/24.
//

import SwiftUI

struct RecreationalListView: View {
    let users: [RecreationalUser]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                }
            }
        }.frame(maxWidth: .infinity)
    }
}


#Preview {
    RecreationalListView(users: RecreationalPlayersMockData.getMockUsers())
}
