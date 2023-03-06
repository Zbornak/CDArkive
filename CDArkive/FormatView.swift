//
//  FormatView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct FormatView: View {
    let format: String
    
    var body: some View {
        switch format {
        case "CD":
            return Text("⦿")
        case "SACD":
            return Text("⦿")
        case "Blu-Spec CD":
            return Text("⦿")
        case "DVD Audio":
            return Text("⦿")
        case "Vinyl":
            return Text("◉")
        case "Cassette":
            return Text("🀹")
        case "Minidisc":
            return Text("🀹")
        default:
            return Text("◦⦿")
        }
    }
}

struct FormatView_Previews: PreviewProvider {
    static var previews: some View {
        FormatView(format: "CD")
    }
}
