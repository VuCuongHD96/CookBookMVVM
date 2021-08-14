//
//  SearchViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit
import Reusable

final class SearchViewController: UIViewController {

    // MARK: - Property
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.search
}
