//
//  DataController.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CDArkive")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data falied to load: \(error.localizedDescription)")
            }
        }
    }
}
