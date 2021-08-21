//
//  CategoryUseCase.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import RxSwift
import RxCocoa

protocol CategoryUseCaseType {
    func getCategories() -> Observable<[Category]>
}

struct CategoryUseCase: CategoryUseCaseType {
    
    func getCategories() -> Observable<[Category]> {
        let request = CategoriesRequest()
        let repository = CategoryRepository()
        return repository.getCategories(input: request)
    }
}
