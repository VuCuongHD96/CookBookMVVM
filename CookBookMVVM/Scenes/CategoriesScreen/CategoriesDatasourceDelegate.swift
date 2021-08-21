//
//  CategoriesDatasourceDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit

final class CategoriesDatasourceDelegate: NSObject {
    
    // MARK: - Define
    typealias PassData = (Category) -> Void
    
    // MARK: - Property
    var categories = [Category]()
    var didChoiseData: PassData?
    
    init(categories: [Category]) {
        self.categories = categories
    }
}

extension CategoriesDatasourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let category = categories[row]
        
        let cell: CategoryTitleCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: category)
        return cell
    }
}

extension CategoriesDatasourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let category = categories[row]        
        didChoiseData?(category)
    }
}
