//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal : Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    InsetGalleryView(animal: Animal(id: "lion", name: "Lion", headline: "Headline", description: "Desc", link: "Link", image: "lion", gallery: ["lion"], fact: ["fact"]))
}
