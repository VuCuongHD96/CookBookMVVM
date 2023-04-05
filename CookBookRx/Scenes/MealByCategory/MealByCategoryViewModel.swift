//
//  MealByCategoryViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import MGArchitecture
import RxCocoa
import RxSwift

struct MealByCategoryViewModel {
    let navigator: MealByCategoryNavigatorType
    let useCase: MealByCategoryUseCaseType
    let category: Category
}

extension MealByCategoryViewModel: ViewModel {
 
    struct Input {
        let loadTrigger: Driver<Void>
        let backTrigger: Driver<Void>
        let searchTrigger: Driver<Void>
    }
    
    struct Output {
        let meals: Driver<[Meal]>
        let totalRepice: Driver<String>
        let categoryName: Driver<String>
        let categoryUrlString: Driver<String>
        let backDidTap: Driver<Void>
        let searchDidTap: Driver<Void>
    }
    
    func transform(_ input: Input, disposeBag: RxSwift.DisposeBag) -> Output {
        let error = ErrorTracker()
        let indicator = ActivityIndicator()
        
        let mealStartData = Array(repeating: Meal(), count: 5)
        let meals = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getMeals(by: category)
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }.startWith(mealStartData)
        
        let totalRepice = meals.map {
            String("Total Repice: \($0.count) items")
        }
        
        let categoryName = input.loadTrigger
            .map {
                return self.category.name
            }
        
        let categoryUrlString = input.loadTrigger
            .map {
                category.imageURL
            }
        
        let backDidTap = input.backTrigger
            .do(onNext: {
                navigator.toPrevious()
            })
        
        let searchDidTap = input.searchTrigger
            .do(onNext: {
                navigator.toSearch()
            })
        
        return Output(meals: meals,
                      totalRepice: totalRepice,
                      categoryName: categoryName,
                      categoryUrlString: categoryUrlString,
                      backDidTap: backDidTap,
                      searchDidTap: searchDidTap)
    }
}
