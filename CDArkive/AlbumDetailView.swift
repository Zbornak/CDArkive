//
//  AlbumDetailView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(album.genre ?? "Rock")
                    .resizable()
                    .scaledToFit()
                
                Text(album.genre?.uppercased() ?? "ROCK")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(album.artist ?? "Unkown artist")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(album.notes ?? "No notes")
                .padding()
            
            RatingView(rating: .constant(Int(album.rating)))
                .font(.largeTitle)
            
            
        }
        .navigationTitle(album.title ?? "Unknown album")
        .navigationBarTitleDisplayMode(.inline)
    }
}
