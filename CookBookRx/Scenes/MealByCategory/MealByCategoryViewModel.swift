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
}

extension MealByCategoryViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) -> Output {
        
        return Output()
    }
}
