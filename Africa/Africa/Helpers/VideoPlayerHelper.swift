//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Rodrigo Conte on 13/01/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer? {
    if let url = Bundle.main.url(forResource: fileName.lowercased(), withExtension: fileExtension) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    
    return videoPlayer
    
}
