//
//  MealByCategoryViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit
import Reusable

final class MealByCategoryViewController: UIViewController {

    // MARK: - Property
    var viewModel: MealByCategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
}

extension MealByCategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.mealByCategory
}
