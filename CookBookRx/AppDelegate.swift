//
//  AppDelegate.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        toMainScreen()
        return true
    }
    
    private func toMainScreen() {
        guard let window = window else {
            return
        }
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = story.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

