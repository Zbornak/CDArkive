//
//  LanguageView.swift
//  CDArkive
//
//  Created by Mark Strijdom on 06/03/2023.
//

import SwiftUI

struct LanguageView: View {
    let language: String
    
    var body: some View {
        switch language {
        case "English":
            return Text("🇬🇧")
        case "Afrikaans":
            return Text("🇿🇦")
        case "German":
            return Text("🇩🇪")
        case "Dutch":
            return Text("🇳🇱")
        case "Japanese":
            return Text("🇯🇵")
        case "Mandarin":
            return Text("🇨🇳")
        case "Polish":
            return Text("🇵🇱")
        default:
            return Text("🇮🇹")
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(language: "English")
    }
}
