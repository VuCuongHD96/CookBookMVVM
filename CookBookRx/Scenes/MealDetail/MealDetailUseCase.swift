//
//  MealDetailUseCase.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import UIKit
import RxSwift

protocol MealDetailUseCaseType {
    func getMeal(by id: String) -> Observable<[Meal]>
}

struct MealDetailUseCase: MealDetailUseCaseType {

    func getMeal(by id: String) -> Observable<[Meal]> {
        let request = MealRequest(id: id)
        let mealRepository = MealRepository()
        return mealRepository.getMeals(input: request)
    }
}
