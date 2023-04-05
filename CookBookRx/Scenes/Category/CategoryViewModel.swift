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
    let navigator: CategoryNavigatorType
}

extension CategoryViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
        let searchTrigger: Driver<Void>
    }
    
    struct Output {
        let categories: Driver<[Category]>
        let error: Driver<Error>
        let indicator: Driver<Bool>
        let selected: Driver<Void>
        let search: Driver<Void>
    }
    
    func transform(_ input: Input, disposeBag: RxSwift.DisposeBag) -> Output {
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
        
        let selected = input.selectTrigger
            .withLatestFrom(categories) { (indexPath, categories) -> Category in
                let row = indexPath.row
                let category = categories[row]
                return category
            }.do { category in
                navigator.toMealByCategory(data: category)
            }.mapToVoid()
        
        let search = input.searchTrigger
            .do(onNext: {
                navigator.toSearch()
            })
        
        return Output(
            categories: categories,
            error: error.asDriver(),
            indicator: indicator.asDriver(),
            selected: selected,
            search: search
        )
    }
}
