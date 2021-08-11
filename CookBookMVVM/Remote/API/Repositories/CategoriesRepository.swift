//
//  CategoriesRepository.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation

protocol CategoriesRepository {
    func getCategories(completion: @escaping (BaseResult<CategoriesResponse>) -> Void)
}

final class CategoriesRepositoryImpl: CategoriesRepository {
    
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getCategories(completion: @escaping (BaseResult<CategoriesResponse>) -> Void) {
        let input = CategoriesRequest()
        guard let api = api else {
            return
        }
        api.request(input: input) { (object: CategoriesResponse?, error) in
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
