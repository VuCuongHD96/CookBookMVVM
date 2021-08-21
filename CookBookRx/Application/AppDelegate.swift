//
//  AppDelegate.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        bindViewModel()
        return true
    }
    
    private func bindViewModel() {
        guard let window = window else {
            return
        }
        let navigator = AppNavigator(window: window)
        let viewModel = AppViewModel(navigator: navigator)
        let input = AppViewModel.Input(loadTrigger: Driver.just(Void()))
        let output = viewModel.transform(input)
        
        output.toMain
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

