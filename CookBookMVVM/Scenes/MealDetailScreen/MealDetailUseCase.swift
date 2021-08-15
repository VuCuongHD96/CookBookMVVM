//
//  MealDetailUseCase.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation

protocol MealDetailUseCaseType {
}

struct MealDetailUseCase: MealDetailUseCaseType {
    
    // MARK: - Property
    private let mealsRepository = MealsRepositoryImpl(api: APIService.share)
}
