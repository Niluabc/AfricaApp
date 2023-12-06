//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Nilam Shah on 05/12/23.
//

import SwiftUI

struct MapAnnotationView: View {
    var location : NationalParkLocation
    @State private var animation: Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    MapAnnotationView(location: NationalParkLocation(id: "kruger", name: "Kruger National Park", image: "map-kruger", latitude: -23.9883848, longitude: 31.5525515))
}
