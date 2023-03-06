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
            Text("Count: \(singles.count)")
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
