//
//  SingleDetailView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct SingleDetailView: View {
    let single: Single
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(single.genre ?? "Rock")
                    .resizable()
                    .scaledToFit()
                
                Text(single.genre?.uppercased() ?? "ROCK")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(single.artist ?? "Unkown artist")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(single.notes ?? "No notes")
                .padding()
            
            RatingView(rating: .constant(Int(single.rating)))
                .font(.largeTitle)
            
            
        }
        .navigationTitle(single.title ?? "Unknown album")
        .navigationBarTitleDisplayMode(.inline)
    }
}
