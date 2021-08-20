//
//  VideoViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/18/21.
//

import UIKit
import Reusable
import youtube_ios_player_helper

final class VideoViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var playerView: YTPlayerView!
    
    // MARK: - Property
    var viewModel: VideoViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupPortrait()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        let videoId = viewModel.videoID
        playerView.load(withVideoId: videoId)
        playerView.delegate = viewModel.videoDelegate
    }
}

extension VideoViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        setupLandscapeRight()
    }
    
    private func setupPortrait() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    private func setupLandscapeRight() {
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension VideoViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.video
}
