//
//  AddAlbum.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import CoreData
import SwiftUI

struct AddAlbum: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var artist = ""
    @State private var format = "CD"
    @State private var genre = "Rock"
    @State private var id = UUID()
    @State private var language = "English"
    @State private var notes = ""
    @State private var rating = 3
    @State private var releaseDate = Date.now
    @State private var title = ""
    
    let formats = ["CD", "SACD", "Blu-Spec CD", "DVD Audio", "Vinyl", "Cassette", "Minidisc", "Reel"]
    let genres = ["Rock", "Hip Hop", "Jazz", "Classical", "Opera", "American Songbook", "Metal", "Pop", "J-Pop", "Folk", "Electro", "Emo", "Comedy"]
    let languages = ["English", "Afrikaans", "German", "Dutch", "Japanese", "Mandarin", "Polish", "Italian"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Album title", text: $title)
                    TextField("Artist name", text: $artist)
                    VStack {
                        DatePicker(selection: $releaseDate, in: ...Date.now, displayedComponents: .date) {
                            Text("Release date")
                        }
                    }
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $notes)
                    RatingView(rating: $rating)
                } header: {
                    Text("Notes")
                }
                
                Section {
                    Picker("Language", selection: $language) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Format", selection: $format) {
                        ForEach(formats, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        let newAlbum = Album(context: moc)
                        newAlbum.id = UUID()
                        newAlbum.artist = artist
                        newAlbum.format = format
                        newAlbum.genre = genre
                        newAlbum.language = language
                        newAlbum.notes = notes
                        newAlbum.rating = Int16(rating)
                        newAlbum.title = title
                        newAlbum.releaseDate = releaseDate
                        
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add new Album")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AddAlbum_Previews: PreviewProvider {
    static var previews: some View {
        AddAlbum()
    }
}
