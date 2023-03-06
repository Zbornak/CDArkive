//
//  ContentView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.artist)]) var albums: FetchedResults<Album>
    
    @State private var showingAddAlbumScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(albums) { album in
                    NavigationLink {
                        AlbumDetailView(album: album)
                    } label: {
                        HStack {
                            GenreView(genre: album.genre ?? "Unknown genre")
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(album.title ?? "Unknown title")
                                    .font(.headline)
                                
                                HStack {
                                    Text(album.artist ?? "Unknown artist")
                                        .foregroundColor(.secondary)
                                    
                                    FormatView(format: album.format ?? "Unknown format")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("CDArkive")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddAlbumScreen.toggle()
                    } label: {
                        Label("Add album", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddAlbumScreen) {
                AddAlbum()
            }
        }
    }
    
    func deleteAlbums(at offsets: IndexSet) {
        for offset in offsets {
            let album = albums[offset]
            moc.delete(album)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
