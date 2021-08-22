//
//  MealDetailViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture
import RxSwift
import RxCocoa
import RxDataSources

struct MealDetailViewModel {
    let navigator: MealDetailNavigatorType
    let useCase: MealDetailUseCaseType
    let meal: Meal
}

extension MealDetailViewModel: ViewModelType {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let mealUrlString: Driver<String>
        let categoryName: Driver<String>
        let mealName: Driver<String>
        let backDidTap: Driver<Void>
        let activity: Driver<Bool>
        let sections: Driver<[SectionData]>
    }
    
    func transform(_ input: Input) -> Output {
        let activity = ActivityIndicator()
        let error = ErrorTracker()
        
        let backDidTap = input.backTrigger
            .do(onNext: {
                navigator.toPrevious()
            }).mapToVoid()
        
        let mealData = input.loadTrigger
            .flatMapLatest { _ in
                return useCase.getMeal(by: meal.identifier)
                    .trackError(error)
                    .trackActivity(activity)
                    .asDriverOnErrorJustComplete()
            }.map {
                $0.first
            }.unwrap()
        
        let mealUrlString = mealData
            .map {
                $0.imageString
            }
        
        let categoryName = mealData
            .map {
                $0.category
            }
        
        let mealName = mealData
            .map {
                $0.name
            }
        
        let sectionOne = SectionData(header: "First section", items: ["A", "B"])
        let sectionTwo = SectionData(header: "Second section", items: ["1", "2"])

        let sectionArray = [sectionOne, sectionTwo]

        let sections = input.loadTrigger
            .map {
                sectionArray
            }
        



        return Output(mealUrlString: mealUrlString,
                      categoryName: categoryName,
                      mealName: mealName,
                      backDidTap: backDidTap,
                      activity: activity.asDriver(),
                      sections: sections)
    }
}
