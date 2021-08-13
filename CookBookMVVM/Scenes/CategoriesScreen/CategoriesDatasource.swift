//
//  CategoriesDatasource.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit

final class CategoriesDatasource: NSObject, UITableViewDataSource {
    
    var categories = [Category]()
    
    init(categories: [Category]) {
        self.categories = categories
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let category = categories[row]
        
        let cell: CategoryTitleCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(category: category)
        return cell
    }
}
