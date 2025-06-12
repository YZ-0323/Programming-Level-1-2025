//
//  SecondView.swift
//  Pages
//
//  Created by Yizhen Zhu - 143 on 2025-04-10.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("This is the Second View")
                .font(.title)
                .padding()
        }
        
        NavigationLink(destination: ThirdView()) {
            Text("Go to Third View")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .navigationTitle("Second View")
        }
    }
}
    struct SecondView_Previews: PreviewProvider {
        static var previews: some View {
            SecondView()
        }
    }
