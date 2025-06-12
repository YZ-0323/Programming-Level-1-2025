//
//  SecondView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-11.
//

import SwiftUI

struct SecondView: View {
    @AppStorage("username") private var username: String = "Guest"
    var body: some View {
        ZStack{
            Color.color2.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).opacity(0.7)
            VStack {
                Text("Please Enter Your Username")
                    .font(.title)
                    .padding()
                    .foregroundColor(.color3)
                
                TextField("Place your username here", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 320)
                NavigationLink(destination: ThirdView()) {
                    Text("Choose Your Style")
                        .font(.title)
                        .padding()
                        .background(Color.color2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SecondView()
}
