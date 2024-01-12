//
//  VideoListView.swift
//  Africa
//
//  Created by Rodrigo Conte on 11/01/24.
//

import SwiftUI

struct VideoListItemView: View {
    
    let video: VideoModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
                    
            }// - ZStack
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .foregroundStyle(.accent)
                    .fontWeight(.heavy)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }// - VStack
        }// - HStack
    }
}

#Preview {
    @State var videos: [VideoModel] = Bundle.main.decode([VideoModel].self, from: "videos.json")
    return VideoListItemView(video: videos[1])
}
