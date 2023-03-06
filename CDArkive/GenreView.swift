//
//  GenreView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct GenreView: View {
    let genre: String
    
    var body: some View {
        switch genre {
        case "Rock":
            return Text("🎸")
        case "Hip Hop":
            return Text("🎧")
        case "Jazz":
            return Text("🎺")
        case "Classical":
            return Text("🎻")
        case "Opera":
            return Text("😲")
        case "American Songbook":
            return Text("🎙")
        case "Metal":
            return Text("🤘")
        case "Pop":
            return Text("👩‍🎤")
        case "J-Pop":
            return Text("🍥")
        case "Folk":
            return Text("🪕")
        case "Electro":
            return Text("🤖")
        default:
            return Text("🎭")
        }
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genre: "Rock")
    }
}
