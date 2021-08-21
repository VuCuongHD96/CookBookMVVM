//
//  ViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Then

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.do {
            $0.backgroundColor = .cyan
        }
    }
}
