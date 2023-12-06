//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Nilam Shah on 05/12/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}

#Preview {
    AnimalGridItemView(animal: Animal(id: "lion", name: "Lion", headline: "Lion Headline", description: "Lion Description", link: "", image: "lion", gallery: ["abc"], fact: ["fact1"]))
}
