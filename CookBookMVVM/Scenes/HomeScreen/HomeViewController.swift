//
//  HomeViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/16/21.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.home
}
