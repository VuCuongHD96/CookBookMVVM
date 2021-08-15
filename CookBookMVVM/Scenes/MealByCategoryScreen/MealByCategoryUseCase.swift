//
//  MealByCategoryUseCase.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import Foundation

protocol MealByCategoryUseCaseType {
    func getMeals(by category: Category, completionHandler: @escaping ([Meal]) -> Void)
}

struct MealByCategoryUseCase: MealByCategoryUseCaseType {
    // MARK: - Property
    private let mealsRepository = MealsRepositoryImpl(api: APIService.share)
    
    // MARK: - Data
    func getMeals(by category: Category, completionHandler: @escaping ([Meal]) -> Void) {
        mealsRepository.getMeals(by: category) { result in
            switch result {
            case.success(let mealsResponse):
                guard let mealArray = mealsResponse?.meals else {
                    return
                }
                completionHandler(mealArray)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
