//
//  ContentView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var albums: FetchedResults<Album>
    
    @State private var showingAddAlbumScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(albums.count)")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
