//
//  MealByCategoryViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import Foundation

final class MealByCategoryViewModel {
    
    // MARK: - Property
    let navigator: MealByCategoryNavigatorType
    let useCase: MealByCategoryUseCaseType
    let category: Category
    
    init(navigator: MealByCategoryNavigatorType, useCase: MealByCategoryUseCaseType, category: Category) {
        self.navigator = navigator
        self.useCase = useCase
        self.category = category
    }
}
