//
//  MealByCategoryDatasouceDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit

final class MealByCategoryDatasouceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 200
    }
    typealias PassData = (Meal) -> Void
    
    // MARK: - Property
    var mealArray = [Meal]()
    var mealDidTap: PassData?
    
    init(mealArray: [Meal]) {
        self.mealArray = mealArray
    }
}

extension MealByCategoryDatasouceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = mealArray[row]

        let cell: MealCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: meal)
        return cell
    }
}

extension MealByCategoryDatasouceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let meal = mealArray[row]
        
        mealDidTap?(meal)
    }
}
