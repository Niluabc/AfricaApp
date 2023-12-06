//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal : Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    AnimalListItemView(animal: Animal(id: "1", name: "Lion", headline: "Desc", description: "desc", link: "link", image: "lion", gallery: ["Hi"], fact: ["hello"]))
}
