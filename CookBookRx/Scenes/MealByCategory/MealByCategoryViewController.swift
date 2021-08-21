//
//  MealByCategoryViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa

final class MealByCategoryViewController: UIViewController {

    // MARK: - Property
    var viewModel: MealByCategoryViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MealByCategoryViewController: BindableType {
    
    func bindViewModel() {
       
    }
}

extension MealByCategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.mealByCategory
}
