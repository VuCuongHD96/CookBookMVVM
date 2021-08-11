//
//  AppDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        gotoMainScreen()
        return true
    }
    
    private func gotoMainScreen() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "vc") as? ViewController else {
            return
        }
        let navigation = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigation
    }
}
