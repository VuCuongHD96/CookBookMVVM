//
//  ViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .green
    }
}

extension ViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.main
}
