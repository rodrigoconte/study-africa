//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Rodrigo Conte on 13/01/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Properties
    
    let videoName: String
    let videoTitle: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            if let player = playVideo(fileName: videoName, fileExtension: "mp4") {
                VideoPlayer(player: player) { }
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
            } else {
                Text("Failed to load video from bundle")
                    .font(.headline)
                    .foregroundStyle(.red)
            }
        } //: - VSTACK
        .tint(.accent)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        VideoPlayerView(videoName: "cheetah", videoTitle: "Cheetah")
    }
}
