//
//  MainPage.swift
//  Pages
//
//  Created by Yizhen Zhu - 143 on 2025-04-10.
//

import SwiftUI

struct MainPage: View {
    
    var body: some View {
            TabView {
                
                HomeView()
                
                    .tabItem {
                        
                        Label("Home", systemImage: "house")
                        
                    }
                
                findView()
                
                    .tabItem {
                        
                        Label("Find", systemImage: "star.fill")
                        
                    }
                
                calcView()
                
                    .tabItem {
                        
                        Label("Calculator", systemImage: "book.pages.fill")
                        
                    }
                
                ProfileView()
                
                    .tabItem {
                        
                        Label("Profile", systemImage: "person.circle")
                        
                    }
                SettingsView()
                
                    .tabItem {
                        
                        Label("Settings", systemImage: "gear")
                        
                    }
                
                
            }
            .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    MainPage()
}
