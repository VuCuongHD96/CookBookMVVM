//
//  HomeViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct HomeViewModel {
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
}

extension HomeViewModel: ViewModel {
 
    struct Input {
        let loadTrigger: Driver<Void>
        let searchTrigger: Driver<Void>
        let categorySelectTrigger: Driver<IndexPath>
        let mealSelectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let categories: Driver<[Category]>
        let categorySelected: Driver<Void>
        let meals: Driver<[Meal]>
        let mealSelected: Driver<Void>
        let search: Driver<Void>
    }
    
    func transform(_ input: Input, disposeBag: RxSwift.DisposeBag) -> Output {

        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let categoriesStartData = Array(repeating: Category(), count: 3)
        let categories = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getCategories()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }.startWith(categoriesStartData)
        
        let mealsStartData = Array(repeating: Meal(), count: 5)
        let meals = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getMeals()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }.startWith(mealsStartData)
        
        let categorySelected = input.categorySelectTrigger
            .withLatestFrom(categories) { indexPath, categoryArray -> Category in
                let row = indexPath.row
                let category = categoryArray[row]
                return category
            }.do(onNext: { category in
                navigator.toMealByCategory(data: category)
            })
            .mapToVoid()
        
        let mealSelected = input.mealSelectTrigger
            .withLatestFrom(meals) { indexPath, mealArray -> Meal in
                let row = indexPath.row
                let meal = mealArray[row]
                return meal
            }.do(onNext: { meal in
                navigator.toMealDetail(data: meal)
            })
            .mapToVoid()
        
        let search = input.searchTrigger
            .do(onNext: {
                navigator.toSearch()
            })
        
        return Output(categories: categories,
                      categorySelected: categorySelected,
                      meals: meals,
                      mealSelected: mealSelected,
                      search: search)
    }
}
