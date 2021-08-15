//
//  MealDetailUseCase.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation

protocol MealDetailUseCaseType {
    
    func getMeals(by meal: Meal, completionHandler: @escaping (Meal) -> Void) 
}

struct MealDetailUseCase: MealDetailUseCaseType {
    
    // MARK: - Property
    private let mealsRepository = MealsRepositoryImpl(api: APIService.share)
    
    // MARK: - Data
    func getMeals(by meal: Meal, completionHandler: @escaping (Meal) -> Void) {
        mealsRepository.getMeal(by: meal.identifier) { result in
            switch result {
            case .success(let mealsResponse):
                guard let meal = mealsResponse?.meals.first else {
                    return
                }
                completionHandler(meal)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
