//
//  VideoListView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode(file: "videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink {
                    VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                } label: {
                    VideoListItem(video: item)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
