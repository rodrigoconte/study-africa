//
//  VideoListView.swift
//  Africa
//
//  Created by Rodrigo Conte on 27/12/23.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Properties
    @State var videos: [VideoModel]
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoName: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }// - Loop
            }// - List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }// - NavigationStack
    }// - Body
}

// MARK: - Preview
#Preview {
    @State var videos: [VideoModel] = Bundle.main.decode([VideoModel].self, from: "videos.json")
    return VideoListView(videos: videos)
}
