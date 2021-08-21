//
//  HomeViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import MGArchitecture
import RxCocoa
import RxSwift

final class HomeViewController: UIViewController {

    // MARK: - Property
    var viewModel: HomeViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeViewController: BindableType {
    func bindViewModel() {
        
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.home
}
