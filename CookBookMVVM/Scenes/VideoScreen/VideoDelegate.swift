//
//  VideoDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/19/21.
//

import youtube_ios_player_helper

final class VideoDelegate: NSObject {
    
    // MARK: - Define
    typealias StopHandler = () -> Void
    
    // MARK: - Property
    var videoDidStop: StopHandler?
}
    
extension VideoDelegate: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }

    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        if state == .paused {
            videoDidStop?()
        }
    }
}
