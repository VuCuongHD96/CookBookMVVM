//
//  CategoryViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import NSObject_Rx

final class CategoryViewController: UIViewController {

    var viewModel: CategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = CategoryViewModel.Input(loadTrigger: Driver.just(Void()))
        let output = viewModel.transform(input)
        
        output.categories
            .drive()
            .disposed(by: rx.disposeBag)
            
    }
}

extension CategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.category
}
