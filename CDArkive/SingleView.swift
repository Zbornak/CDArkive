//
//  SingleView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct SingleView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var singles: FetchedResults<Single>
    
    @State private var showingAddSingleScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(singles) { single in
                    NavigationLink {
                        Text(single.title ?? "Unknown")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: single.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(single.title ?? "Unknown title")
                                    .font(.headline)
                                
                                HStack {
                                    Text(single.artist ?? "Unknown artist")
                                        .foregroundColor(.secondary)
                                    
                                    GenreView(genre: single.genre ?? "Unknown genre")
                                    LanguageView(language: single.language ?? "Unknown language")
                                    FormatView(format: single.format ?? "Unknown format")
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
                            showingAddSingleScreen.toggle()
                        } label: {
                            Label("Add single", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddSingleScreen) {
                    AddSingle()
                }
        }
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
