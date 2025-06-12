//
//  Homeview.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import SwiftUI

struct HomeView: View {

    var body: some View {

        NavigationStack {

            List {

                NavigationLink(destination: DetailView(title: "Item 1")) {

                    Text("Go to Item 1")

                }

                NavigationLink(destination: DetailView(title: "Item 2")) {

                    Text("Go to Item 2")

                }

            }

            .navigationTitle("Home")

        }

    }

}

struct DetailView: View {
    
    let title: String
    
    var body: some View {
        
        Text("Details for \(title)")
        
            .font(.largeTitle)
        
            .padding()
        
    }
}
#Preview{
    HomeView()
}
