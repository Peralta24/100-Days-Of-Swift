//
//  Rating.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 26/11/25.
//

import SwiftUI

struct Rating: View {
    @Binding var rating : Int
    
    var label = ""
    var maximunRating : Int = 10
    
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor =  Color.yellow
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximunRating + 1, id: \.self) {number in
                Button{
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        }else {
            onImage
        }
    }
}

#Preview {
    Rating(rating: .constant(8))
}
