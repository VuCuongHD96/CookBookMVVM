//
//  MealByCategoryViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit
import Reusable
import Then

final class MealByCategoryViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    var viewModel: MealByCategoryViewModel! {
        didSet {
            viewModel.dataDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = viewModel.mealByCategoryDatasouceDelegate
                self.tableView.delegate = viewModel.mealByCategoryDatasouceDelegate
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
}

extension MealByCategoryViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: MealCell.self)
            $0.separatorStyle = .none
        }
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension MealByCategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.mealByCategory
}
