//
//  SearchViewController.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import UIKit
import Reusable
import MGArchitecture

final class SearchViewController: UIViewController {

    // MARK: - Property
    var viewModel: SearchViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchViewController: BindableType {
    func bindViewModel() {
        
    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.search
}
