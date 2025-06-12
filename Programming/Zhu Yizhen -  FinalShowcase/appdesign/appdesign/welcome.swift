//
//  welcome.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-04.
//

import SwiftUI

struct welcome: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.color1)
                Image(systemName: "truck.box.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.color3)
                Text("  ")
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.color3, .color1)
                    .offset(x: -18, y: -13)
            }
            Text("Welcome to Pro Orderer")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
                .foregroundColor(.color3)
            Text("Enjoy the Most Convenient Food Ordering Experience")
                .font(.title2)
                .foregroundColor(.color3)
        }
        .padding()
    }
}
#Preview {
    welcome()
}
