//
//  VideoListItem.swift
//  Africa
//
//  Created by Nilam Shah on 01/12/23.
//

import SwiftUI

struct VideoListItem: View {
    let video: Video
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 42)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name.capitalized)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    VideoListItem(video: Video(id: "gorilla", name: "gorilla", headline: "Lion description headline goes here Lion description headline goes here"))
}
