//
//  HomeMealDatasourceDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import UIKit

final class HomeMealDatasourceDelegate: NSObject {

    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 200
    }
    
    // MARK: - Property
    var mealArray = [Meal]()
    
    init(mealArray: [Meal]) {
        self.mealArray = mealArray
    }
}

extension HomeMealDatasourceDelegate: UITableViewDataSource {
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

extension HomeMealDatasourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}
