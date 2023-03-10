//
//  SingleView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct SingleView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.artist)]) var singles: FetchedResults<Single>
    
    @State private var showingAddSingleScreen = false
    
    @State private var showingFilteredSingleListView = false
    
    @State private var singleSearchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(singles) { single in
                    NavigationLink {
                        SingleDetailView(single: single)
                    } label: {
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
                }
                .onDelete(perform: deleteSingles)
            }
                .navigationTitle("CDArkive")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
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
                .sheet(isPresented: $showingFilteredSingleListView) {
                    FilteredSingleListView(filter: singleSearchText)
                }
        }
        .searchable(text: $singleSearchText, prompt: "Search artists") {
            Button("Search") {
                showingFilteredSingleListView.toggle()
            }
        }
    }
    
    func deleteSingles(at offsets: IndexSet) {
        for offset in offsets {
            let single = singles[offset]
            moc.delete(single)
        }
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
