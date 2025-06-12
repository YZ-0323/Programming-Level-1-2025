//
//  ContentView.swift
//  Pages
//
//  Created by Yizhen Zhu - 143 on 2025-04-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: SecondView()) {
                    Text("Go to Second View")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("First View") 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
