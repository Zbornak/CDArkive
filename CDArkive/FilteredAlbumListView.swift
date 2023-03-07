//
//  FilteredAlbumListView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 07/03/2023.
//

import SwiftUI

struct FilteredAlbumListView: View {
    @FetchRequest var fetchRequest: FetchedResults<Album>
    
    var body: some View {
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
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Album>(sortDescriptors: [], predicate: NSPredicate(format: "artist BEGINSWITH[c] %@", filter))
    }
}
