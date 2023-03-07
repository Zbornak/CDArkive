//
//  FilteredSingleListView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 07/03/2023.
//

import SwiftUI

struct FilteredSingleListView: View {
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest var fetchRequest: FetchedResults<Single>
    
    var body: some View {
        NavigationView {
            List(fetchRequest, id: \.self) { single in
                HStack {
                    GenreView(genre: single.genre ?? "Unknown genre")
                        .font(.largeTitle)
                        
                    VStack(alignment: .leading) {
                        Text(single.title ?? "Unknown title")
                            .font(.headline)
                            
                        HStack {
                            Text(single.artist ?? "Unknown artist")
                                .foregroundColor(.secondary)
                                
                            FormatView(format: single.format ?? "Unknown format")
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
        _fetchRequest = FetchRequest<Single>(sortDescriptors: [], predicate: NSPredicate(format: "artist BEGINSWITH[c] %@", filter))
    }
}

