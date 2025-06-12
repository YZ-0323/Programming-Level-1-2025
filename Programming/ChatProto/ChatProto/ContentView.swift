//
//  ContentView.swift
//  ChatProto
//
//  Created by Yizhen Zhu - 143 on 2025-01-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Knock Knock, 👊")
                .padding()
                .background(Color.yellow, in:RoundedRectangle(cornerRadius: 8))
            Text("Who's there?")
                .padding()
                .background(Color.teal, in:RoundedRectangle(cornerRadius: 8))
            Button("a")
            {
            
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
