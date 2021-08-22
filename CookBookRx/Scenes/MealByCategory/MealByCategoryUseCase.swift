//
//  MealByCategoryUseCase.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import RxSwift

protocol MealByCategoryUseCaseType {
    func getMeals(by category: Category) -> Observable<[Meal]>
}

struct MealByCategoryUseCase: MealByCategoryUseCaseType {
    
    func getMeals(by category: Category) -> Observable<[Meal]> {
        let request = MealRequest(categoryName: category.name)
        let repository = MealRepository()
        return repository.getMeals(input: request)
    }
}
