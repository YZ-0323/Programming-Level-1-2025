 //
//  ContentView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-04.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("welcomed") private var welcomed: Bool = false
    @AppStorage("gohome") private var gohome: Bool = false
    var body: some View {
        if (!welcomed)
        {
            NavigationView {
                TabView {
                    welcome()
                    SecondWelcome()
                    searchpage()
                }
                .background(Color.color2.opacity(0.7))
                .tabViewStyle(.page)
            }
        }
        else if(gohome)
        {
            MainPage()
        }
        else if(welcomed)
        {
            MainPage()
        }
    }
}

#Preview {
    ContentView()
}
