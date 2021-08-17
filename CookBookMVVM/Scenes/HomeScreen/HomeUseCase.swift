//
//  HomeUseCase.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import Foundation

protocol HomeUseCaseType {
    func getAllMeal(completionHandler: @escaping ([Meal]) -> Void)
    func getAllCategory(completionHandler: @escaping ([Category]) -> Void) 
}

struct HomeUseCase: HomeUseCaseType {
    
    // MARK: - Property
    private let mealsRepository = MealsRepositoryImpl(api: APIService.share)
    private let categoryRepository = CategoriesRepositoryImpl(api: APIService.share)

    // MARK: - Data
    func getAllMeal(completionHandler: @escaping ([Meal]) -> Void) {
        mealsRepository.getAllMeal { result in
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
    
    func getAllCategory(completionHandler: @escaping ([Category]) -> Void) {
        categoryRepository.getCategories { result in
            switch result {
            case.success(let categoriesResponse):
                guard let categoryArray = categoriesResponse?.categories else {
                    return
                }
                completionHandler(categoryArray)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
