//
//  ThirdView.swift
//  Pages
//
//  Created by Yizhen Zhu - 143 on 2025-04-10.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
            Text("This is the Third View")
                .font(.title)
                .padding()
        }
        .navigationTitle("Third View") 
        
        NavigationLink(destination: MainPage()) {
            Text("Start")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .navigationTitle("Third View")
        }

    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

