//
//  MealDetailViewController.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture
import RxCocoa
import RxSwift
import Reusable

final class MealDetailViewController: UIViewController {

    // MARK: - Outlet
    
    // MARK: - Property
    var viewModel: MealDetailViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MealDetailViewController: Bindable {
    func bindViewModel() {
        
    }
}

extension MealDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.mealDetail
}
