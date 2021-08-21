//
//  HomeUseCase.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import RxCocoa
import RxSwift

protocol HomeUseCaseType {
    func getCategories() -> Observable<[Category]>
    func getMeals() -> Observable<[Meal]> 
}

struct HomeUseCase: HomeUseCaseType {
    func getCategories() -> Observable<[Category]> {
        let request = CategoriesRequest()
        let repository = CategoryRepository()
        return repository.getCategories(input: request)
    }
    
    func getMeals() -> Observable<[Meal]> {
        let request = MealRequest()
        let repository = MealRepository()
        return repository.getMeals(input: request)
    }
}
