//
//  CoverImageView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK : PROPERTIES
    let coverImages : [CoverImage] = Bundle.main.decode(file: "covers.json")
    // MARK : BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { image in
                Image(image.name)
                  .resizable()
                  .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
