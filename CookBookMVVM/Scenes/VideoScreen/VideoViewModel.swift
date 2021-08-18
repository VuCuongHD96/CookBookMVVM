//
//  VideoViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/19/21.
//

import Foundation

protocol VideoViewModelType {
    
    // MARK: - Define
    typealias Listener = (VideoViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var videoDelegate: VideoDelegate! { get }
    var videoID: String { get }
    
    // MARK: - Data
    func showData()
}

final class VideoViewModel: VideoViewModelType {
        
    // MARK: - Define
    struct Constant {
        static let numberIdYT = 11
    }
    
    // MARK: - Property
    let navigator: VideoNavigatorType
    let meal: Meal
    
    var videoID = ""
    var dataDidChange: Listener?
    var videoDelegate: VideoDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: VideoNavigatorType, meal: Meal) {
        self.navigator = navigator
        self.meal = meal
    }
    
    // MARK: - Data
    func showData() {
        videoID = String(meal.youtubeURL.suffix(Constant.numberIdYT)) 
        videoDelegate = VideoDelegate()
        videoDelegate.videoDidStop = {
            self.navigator.toPreviousScreen()
        }
    }
}
