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
                Image(systemName: "info.circle")
                    .padding()
                    .foregroundColor(.secondary)
                
                Text(single.notes ?? "No notes")
                    .padding(.bottom)
                
                HStack {
                    Text("Format:")
                    FormatView(format: single.format ?? "")
                    Text(single.format ?? "Unknown format")
                }
                
                HStack {
                    Text("Language:")
                    LanguageView(language: single.language ?? "")
                    Text(single.language ?? "Unknown language")
                }
                
                HStack {
                    RatingView(rating: .constant(Int(single.rating)))
                        .font(.title)
                    EmojiRatingView(rating: single.rating)
                        .font(.largeTitle)
                }
                .padding()
            }
            .background(singleBackgroundColor().opacity(0.1))
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
        .background(singleBackgroundColor().opacity(0.3))
    }
    
    func deleteSingle() {
        moc.delete(single)
        try? moc.save()
        dismiss()
    }
    
    func singleBackgroundColor() -> Color {
        if single.genre == "Rock" {
            return Color(red: 82 / 255, green: 61.2 / 255, blue: 49 / 255)
        } else if single.genre == "Hip Hop" {
            return Color(red: 65.9 / 255, green: 52.5 / 255, blue: 42.7 / 255)
        } else if single.genre == "Jazz" {
            return Color(red: 89.8 / 255, green: 63.1 / 255, blue: 45.5 / 255)
        } else if single.genre == "Classical" {
            return Color(red: 62 / 255, green: 71.4 / 255, blue: 61.2 / 255)
        } else if single.genre == "Opera" {
            return Color(red: 89 / 255, green: 73.7 / 255, blue: 57.6 / 255)
        } else if single.genre == "American Songbook" {
            return Color(red: 45.9 / 255, green: 30.2 / 255, blue: 43.5 / 255)
        } else if single.genre == "Metal" {
            return Color(red: 60.4 / 255, green: 55.7 / 255, blue: 75.3 / 255)
        } else if single.genre == "Pop" {
            return Color(red: 100 / 255, green: 46.7 / 255, blue: 96.1 / 255)
        } else if single.genre == "J-Pop" {
            return Color(red: 0 / 255, green: 64.7 / 255, blue: 76.1 / 255)
        } else if single.genre == "Folk" {
            return Color(red: 74.5 / 255, green: 89 / 255, blue: 91.4 / 255)
        } else if single.genre == "Electro" {
            return Color(red: 76.9 / 255, green: 42.4 / 255, blue: 76.1 / 255)
        } else if single.genre == "Emo" {
            return Color(red: 93.7 / 255, green: 86.7 / 255, blue: 62.4 / 255)
        } else {
            return Color(red: 64.7 / 255, green: 81.6 / 255, blue: 73.7 / 255)
        }
    }
}
