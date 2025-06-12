//
//  CommentView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-05-06.
//
import SwiftUI

struct CommentView: View {
    @AppStorage("userComment") private var userComment: String = ""
    @AppStorage("orderHistories") private var orderHistoriesData: Data = Data()
    @State private var navigateToHome = false
    @State private var commentText: String = ""
    @State private var rating: Int = 0
    @Environment(\.dismiss) private var dismiss
    @AppStorage("gohome") private var gohome: Bool = false
    let starImage = "star.fill"
    
    var body: some View {
        VStack {
            Text("Leave a Comment and Rating")
                .font(.largeTitle)
                .padding()

            TextEditor(text: $commentText)
                .frame(height: 150)
                .padding()
                .border(Color.gray, width: 1)
                .cornerRadius(10)

            Text("Rate your experience")
                .font(.headline)
                .padding(.top)

            HStack {
                ForEach(1..<6) { index in
                    Button(action: {
                        rating = index
                    }) {
                        Image(systemName: rating >= index ? starImage : "star")
                            .foregroundColor(rating >= index ? .yellow : .gray)
                            .font(.title)
                    }
                }
            }

            Button("Submit Comment") {
                userComment = commentText

                
                var existingOrders: [OrderHistory] = []
                if let decoded = try? JSONDecoder().decode([OrderHistory].self, from: orderHistoriesData) {
                    existingOrders = decoded
                }

                
                if var lastOrder = existingOrders.last {
                    lastOrder.comment = commentText
                    lastOrder.rating = rating
                    existingOrders[existingOrders.count - 1] = lastOrder

                    if let encoded = try? JSONEncoder().encode(existingOrders) {
                        orderHistoriesData = encoded
                    }
                }
                gohome = true
                dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    gohome = false
                }
            }
            .font(.title2)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Comment & Rating")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}
