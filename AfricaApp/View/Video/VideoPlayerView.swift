//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Nilam Shah on 01/12/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected, fileFormat: "mp4")) {
//                Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,
                alignment: .topLeading
            )
        }
        .navigationTitle(videoTitle)
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
}
