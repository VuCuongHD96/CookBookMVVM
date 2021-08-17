//
//  MealByCategoryViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit
import Reusable
import Then
import SDWebImage

final class MealByCategoryViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var numberOfRecipes: UILabel!
    
    // MARK: - Property
    var viewModel: MealByCategoryViewModel! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    // MARK: - Bind View Model
    private func bindViewModel() {
        setupTableView()
        setupCategory()
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel.mealByCategoryDatasouceDelegate
        tableView.delegate = viewModel.mealByCategoryDatasouceDelegate
        tableView.reloadData()
    }
    
    private func setupCategory() {
        categoryDataShowAnimation()
        let category = viewModel.category
        let urlString = category.imageURL
        guard let url = URL(string: urlString) else { return }
        categoryImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.categoryDataHideAnimation()
        }
        categoryNameLabel.text = category.name
        numberOfRecipes.text = String(self.viewModel.mealArray.count) + " Recipes"
    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        viewModel.buttonBackDidTap = Void()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        viewModel.buttonSearchDidTap = Void()
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
    
    private func categoryDataShowAnimation() {
        categoryImageView.showAnimatedGradientSkeleton()
        categoryNameLabel.showAnimatedGradientSkeleton()
        numberOfRecipes.showAnimatedGradientSkeleton()
    }
    
    private func categoryDataHideAnimation() {
        categoryImageView.hideSkeleton()
        categoryNameLabel.hideSkeleton()
        numberOfRecipes.hideSkeleton()
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension MealByCategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.mealByCategory
}
