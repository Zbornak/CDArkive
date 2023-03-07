//
//  SingleDetailView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct SingleDetailView: View {
    let single: Single
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var showingSingleDeleteAlert = false
    
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
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            Text(single.releaseDate?.formatted(date: .long, time: .omitted) ?? "Unknown date")
                .font(.caption)
                .foregroundColor(.secondary)
            
            VStack {
                Text(single.notes ?? "No notes")
                    .padding()
                
                HStack {
                    RatingView(rating: .constant(Int(single.rating)))
                        .font(.title)
                    EmojiRatingView(rating: single.rating)
                        .font(.largeTitle)
                }
                .padding()
                
                HStack {
                    FormatView(format: single.format ?? "")
                    Text(single.format ?? "Unknown format")
                }
                .padding()
                
                HStack {
                    LanguageView(language: single.language ?? "")
                    Text(single.language ?? "Unknown language")
                }
                .padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        }
        .navigationTitle(single.title ?? "Unknown album")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete single?", isPresented: $showingSingleDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteSingle)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this single?")
        }
        .toolbar {
            Button {
                showingSingleDeleteAlert = true
            } label: {
                Label("Delete this single", systemImage: "trash")
            }
        }
    }
    
    func deleteSingle() {
        moc.delete(single)
        try? moc.save()
        dismiss()
    }
}
