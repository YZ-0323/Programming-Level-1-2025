//
//  ThirdView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-11.
//
import SwiftUI
struct ThirdView: View {
    @AppStorage("foodpref") private var foodpref: String = "None"
    @AppStorage("welcomed") private var welcomed: Bool = false
    var body: some View {
        ZStack{
            Color.color2.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).opacity(0.7)
            VStack {
                Text("Pick your favorite food type")
                    .font(.title)
                    .padding()
                    .foregroundColor(.color3)
                TextField("Place your food preference here", text: $foodpref)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 320)
                NavigationLink(destination: MainPage()) {
                    Text("Start")
                        .font(.title)
                        .padding()
                        .background(Color.color2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ThirdView()
}
