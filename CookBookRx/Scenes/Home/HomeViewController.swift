//
//  HomeViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import MGArchitecture
import RxCocoa
import RxSwift

final class HomeViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchButton: UIButton!
    
    // MARK: - Define
    struct Constant {
        static let categoryCellHeight: CGFloat = 128
        static let categoryCellWidth: CGFloat = 208
        static let mealCellHeight: CGFloat = 200
    }
    
    // MARK: - Property
    var viewModel: HomeViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension HomeViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        collectionView.do {
            $0.register(cellType: CategoryImageCell.self)
            $0.showsHorizontalScrollIndicator = false
            $0.delegate = self
        }
        
        tableView.do {
            $0.register(cellType: MealCell.self)
            $0.separatorStyle = .none
            $0.delegate = self
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    // MARK: - Data
    func setupData() {
        
    }
}

extension HomeViewController: BindableType {
    
    func bindViewModel() {
        
        let input = HomeViewModel.Input(loadTrigger: Driver.just(Void()),
                                        searchTrigger: searchButton.rx.tap.asDriver(),
                                        categorySelectTrigger: collectionView.rx.itemSelected.asDriver(),
                                        mealSelectTrigger: tableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input)
        
        output.categories
            .drive(collectionView.rx.items) { collectionView, index, category in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: CategoryImageCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.setContent(data: category)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.categorySelected
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.meals
            .drive(tableView.rx.items) { tableView, index, meal in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: MealCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContent(data: meal)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.mealSelected
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.search
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.categoryCellWidth, height: Constant.categoryCellHeight)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.mealCellHeight
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.home
}
