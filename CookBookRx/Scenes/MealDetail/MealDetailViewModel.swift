//
//  MealDetailViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct MealDetailViewModel {
    let navigator: MealDetailNavigatorType
    let useCase: MealDetailUseCaseType
}

extension MealDetailViewModel: ViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        return Output()
    }
}
