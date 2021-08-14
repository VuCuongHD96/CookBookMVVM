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
        static let cellHeight: CGFloat = 170
    }
    
    // MARK: - Property
    var mealArray = [Meal]()
    
    init(mealArray: [Meal]) {
        self.mealArray = mealArray
    }
}

extension MealByCategoryDatasouceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MealCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension MealByCategoryDatasouceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}
