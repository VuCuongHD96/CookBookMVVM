//
//  CategoryViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import RxSwift
import RxCocoa
import NSObject_Rx
import MGArchitecture

struct CategoryViewModel {
    let useCase: CategoryUseCaseType
}

extension CategoryViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let categories: Driver<[Category]>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let startData = Array(repeating: Category(), count: 10)
            
        let categories = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getCategories()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }.startWith(startData)
        
        return Output(
            categories: categories,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
