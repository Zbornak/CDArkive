//
//  AlbumDetailView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var showingAlbumDeleteAlert = false
    
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
            
            Text(album.artist ?? "Unknown artist")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            Text(album.releaseDate?.formatted(date: .long, time: .omitted) ?? "Unknown date")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(album.notes ?? "No notes")
                .padding()
            
            HStack {
                RatingView(rating: .constant(Int(album.rating)))
                    .font(.title)
                EmojiRatingView(rating: album.rating)
                    .font(.largeTitle)
            }
            
            HStack {
                FormatView(format: album.format ?? "")
                Text(album.format ?? "Unknown format")
            }
            .padding(.top)
                
            HStack {
                LanguageView(language: album.language ?? "")
                Text(album.language ?? "Unknown language")
            }
        }
        .navigationTitle(album.title ?? "Unknown album")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete album?", isPresented: $showingAlbumDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteAlbum)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this album?")
        }
        .toolbar {
            Button {
                showingAlbumDeleteAlert = true
            } label: {
                Label("Delete this album", systemImage: "trash")
            }
        }
    }
    
    func deleteAlbum() {
        moc.delete(album)
        try? moc.save()
        dismiss()
    }
}
