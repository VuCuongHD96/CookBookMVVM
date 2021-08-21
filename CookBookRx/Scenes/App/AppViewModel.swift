//
//  AppViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
}

extension AppViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
        
    struct Output {
        let toMain: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let toMain = input.loadTrigger
            .do { _ in
                navigator.toCategory()
            }
        
        return Output(toMain: toMain)
    }
}
