//
//  MealsRepository.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation

protocol MealsRepository {
    func getMeals(by category: Category, completion: @escaping (BaseResult<MealResponse>) -> Void)
    func getMeal(by id: String, completion: @escaping (BaseResult<MealResponse>) -> Void)
}

final class MealsRepositoryImpl: MealsRepository {
    
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getMeals(by category: Category, completion: @escaping (BaseResult<MealResponse>) -> Void) {
        let input = MealRequest(categoryName: category.name)
        guard let api = api else {
            return
        }
        api.request(input: input) { (object: MealResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    return completion(.failure(error: nil))
                }
                return completion(.failure(error: error))
            }
            completion(.success(object))
        }
    }
    
    func getMeal(by id: String, completion: @escaping (BaseResult<MealResponse>) -> Void) {
        let input = MealRequest(id: id)
        guard let api = api else {
            return
        }
        api.request(input: input) { (object: MealResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    return completion(.failure(error: nil))
                }
                return completion(.failure(error: error))
            }
            completion(.success(object))
        }
    }
}
