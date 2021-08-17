//
//  FavoriteViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import UIKit
import Reusable

final class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoriteViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.favorite
}
