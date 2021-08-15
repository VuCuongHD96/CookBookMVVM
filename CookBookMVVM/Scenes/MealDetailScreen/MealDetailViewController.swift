//
//  MealDetailViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable

final class MealDetailViewController: UIViewController {

    // MARK: - Property
    var viewModel: MealDetailViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MealDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.mealDetail
}
