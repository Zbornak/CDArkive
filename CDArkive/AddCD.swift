//
//  AddCD.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct AddCD: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var artist = ""
    @State private var format = ""
    @State private var genre = "Rock"
    @State private var id = UUID()
    @State private var language = "English"
    @State private var notes = ""
    @State private var rating = 3
    @State private var title = ""
    
    let genres = ["Rock", "Hip Hop", "Jazz", "Classical", "Opera", "American Songbook", "Metal", "Pop", "J-Pop", "Folk"]
    let languages = ["English", "Afrikaans", "German", "Dutch", "Japanese", "Mandarin", "Polish"]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddCD_Previews: PreviewProvider {
    static var previews: some View {
        AddCD()
    }
}
