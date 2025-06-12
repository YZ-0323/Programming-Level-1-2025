//
//  searchpage.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-04.
//

import SwiftUI

struct searchpage: View {
    var body: some View {
        VStack {
            Text("Let's get started!")
                .font(.largeTitle)
                .foregroundStyle(.color3)
            NavigationLink(destination: SecondView()) {
                Text("Go to Sign-up")
                    .font(.title)
                    .padding()
                    .background(Color.color2)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
#Preview {
    searchpage()
}
