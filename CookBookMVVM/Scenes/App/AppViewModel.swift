//
//  AppViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import Foundation

struct AppViewModel {
    let navigator: AppNavigatorType
}

extension AppViewModel {
    
    struct Input {
    }

    struct Output {
        let toTabbar: Void
    }
    
    func transform() -> Output {
        let toTabbar: Void = navigator.gotoTabbarScreen()
        return Output(toTabbar: toTabbar)
    }
}
