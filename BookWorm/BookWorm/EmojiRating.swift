//
//  EmojiRating.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 26/11/25.
//

import SwiftUI

struct EmojiRating: View {
    let rating : Int
    var body: some View {
        switch rating {
        case 1 :
            Text("☹️")
            
        case 2:
            Text("🥱")
        case 3:
            Text("🫤")
        case 4:
            Text("☺️")
        case 5:
            Text("🤯")
        default:
            Text("🤯")
        }
    }
}

#Preview {
    EmojiRating(rating: 3)
}
