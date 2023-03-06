//
//  CDArkiveApp.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

@main
struct CDArkiveApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .tabItem {
                        Label("Albums", systemImage: "music.quarternote.3")
                    }
                
                SingleView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .tabItem {
                        Label("Singles", systemImage: "music.note")
                    }
            }
        }
    }
}
