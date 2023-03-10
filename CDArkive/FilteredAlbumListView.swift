//
//  FilteredAlbumListView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 07/03/2023.
//

import SwiftUI

struct FilteredAlbumListView: View {
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest var fetchRequest: FetchedResults<Album>
    
    var body: some View {
        NavigationView {
            List(fetchRequest, id: \.self) { album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    HStack {
                        GenreView(genre: album.genre ?? "Unknown genre")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(album.title ?? "Unknown title")
                                .font(.headline)
                            
                            Text(album.artist ?? "Unknown artist")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Search results")
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
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Album>(sortDescriptors: [], predicate: NSPredicate(format: "artist CONTAINS[c] %@", filter))
    }
}
