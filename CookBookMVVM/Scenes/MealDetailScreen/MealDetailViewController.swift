//
//  MealDetailViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable
import Then
import SDWebImage

final class MealDetailViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var mealImageView: UIImageView!
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var mealNameLabel: UILabel!
    
    // MARK: - Property
    var viewModel: MealDetailViewModel! {
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
        setupMealData()
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel.mealDetailDataSourceDelegate
        tableView.delegate = viewModel.mealDetailDataSourceDelegate
        tableView.reloadData()
    }
    
    private func setupMealData() {
        let meal = viewModel.meal
        let urlString = meal.imageString
        guard let url = URL(string: urlString) else { return }
        mealImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.categoryNameLabel.text = meal.category
            self.mealNameLabel.text = meal.name
            self.hideAnimationMealData()
        }
    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        viewModel.buttonBackDidTap = Void()
    }
}

extension MealDetailViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: InstructionCell.self)
            $0.register(cellType: IngredientCell.self)
            $0.register(cellType: HeaderCell.self)
            $0.separatorStyle = .none
        }
        showAnimationMealData()
    }
    
    private func showAnimationMealData() {
        mealImageView.showAnimatedGradientSkeleton()
        categoryNameLabel.showAnimatedGradientSkeleton()
        mealNameLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimationMealData() {
        mealImageView.hideSkeleton()
        categoryNameLabel.hideSkeleton()
        mealNameLabel.hideSkeleton()
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension MealDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.mealDetail
}
