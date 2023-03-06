//
//  AddSingle.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import CoreData
import SwiftUI

struct AddSingle: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var artist = ""
    @State private var format = "CD"
    @State private var genre = "Rock"
    @State private var id = UUID()
    @State private var language = "English"
    @State private var notes = ""
    @State private var rating = 3
    @State private var title = ""
    
    let formats = ["CD", "SACD", "Blu-Spec CD", "DVD Audio", "Vinyl", "Cassette", "Minidisc", "Reel"]
    let genres = ["Rock", "Hip Hop", "Jazz", "Classical", "Opera", "American Songbook", "Metal", "Pop", "J-Pop", "Folk", "Electro", "Comedy"]
    let languages = ["English", "Afrikaans", "German", "Dutch", "Japanese", "Mandarin", "Polish", "Italian"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Single title", text: $title)
                    TextField("Artist name", text: $artist)
                    
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
                        let newSingle = Single(context: moc)
                        newSingle.id = UUID()
                        newSingle.artist = artist
                        newSingle.format = format
                        newSingle.genre = genre
                        newSingle.language = language
                        newSingle.notes = notes
                        newSingle.rating = Int16(rating)
                        newSingle.title = title
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add new Single")
        }
    }
}

struct AddSingle_Previews: PreviewProvider {
    static var previews: some View {
        AddSingle()
    }
}
