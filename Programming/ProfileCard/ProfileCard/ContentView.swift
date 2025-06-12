//
//  ContentView.swift
//  ProfileCard
//
//  Created by Yizhen Zhu - 143 on 2025-01-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    ZStack
        {
            Image("background2")
            VStack {
                Image("background")
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius:10)
                .background(Color.purple,in: RoundedRectangle(cornerRadius: 10))
                Image("TF2Spy_2")
                    .resizable()
                    .frame(width:600,height:300)
                    .clipShape(Circle())
                    .shadow(radius:10)
                
                
                Text("\"SPY\"")
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .imageScale(.large)
                    .background(Color.indigo,in: RoundedRectangle(cornerRadius: 10))
                    .padding()
                Text("Spy from TF2!")
                    .font(.title)
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("-Pro Backstabber-")
                    .padding()
                    .imageScale(.large)
                    .foregroundColor(.white)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
