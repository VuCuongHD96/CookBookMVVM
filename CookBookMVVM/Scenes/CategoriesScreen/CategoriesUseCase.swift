//
//  CategoriesUseCase.swift
//  CookBookMVVM
//
//  Created by admin on 8/13/21.
//

import ObjectMapper

protocol CategoriesUseCaseType {
    func getCategories(completionHandler: @escaping ([Category]) -> Void)
}

struct CategoriesUseCase: CategoriesUseCaseType {
    
    // MARK: - Property
    private let categoriesRepository = CategoriesRepositoryImpl(api: APIService.share)
    
    // MARK: - Data
    func getCategories(completionHandler: @escaping ([Category]) -> Void) {
        categoriesRepository.getCategories { result in
            switch result {
            case .success(let categoriesResponse):
                guard let result = categoriesResponse?.categories else {
                    return
                }
                completionHandler(result)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
