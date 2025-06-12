//
//  ProfileView.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("UserName")
                    .font(.largeTitle)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 370, height: 550)
                VStack{
                    NavigationStack {
                        
                        List {
                            
                            NavigationLink(destination: HistoryView(title: "Item 1")) {
                                
                                Text("Go to Item 1")
                                
                            }
                            
                            NavigationLink(destination: HistoryView(title: "Item 2")) {
                                
                                Text("Go to Item 2")
                                
                            }
                            NavigationLink(destination: HistoryView(title: "Item 3")) {
                                
                                Text("Go to Item 3")
                                
                            }
                            NavigationLink(destination: HistoryView(title: "Item 4")) {
                                
                                Text("Go to Item 4")
                                
                            }
                            NavigationLink(destination: HistoryView(title: "Item 5")) {
                                
                                Text("Go to Item 5")
                                
                            }
                            
                        }
                        
                        .navigationTitle("History")
                        
                    }
                    NavigationStack {
                        
                        List {
                            
                            Text("BLAHBLAHBLAHsssssewckwejvfcjkhewfjkjwevfkjhfhwvkjferwjhfvewjkhvfkewhvfkejwfbewfewrekjfkjewfkjdwevejkfvewkjfvkrwbfkwbfkbewkfhbewrf")
                            
                        }
                        .navigationTitle("Description")
                        
                    }
                    
                }
            }
        }
    }
}

struct HistoryView: View {
    
    let title: String
    
    var body: some View {
        
        Text("History for \(title)")
        
            .font(.largeTitle)
        
            .padding()
        
    }
}

#Preview {
    ProfileView()
}
