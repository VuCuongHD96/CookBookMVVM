//
//  AppViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import Foundation

struct AppViewModel {
    let navigator: AppNavigatorType
}

extension AppViewModel {
    
    struct Input {
    }

    struct Output {
        let toCategories: Void
    }
    
    func transform() -> Output {
        let toCategories: Void = navigator.gotoCategoryScreen()
        return Output(toCategories: toCategories)
    }
}
