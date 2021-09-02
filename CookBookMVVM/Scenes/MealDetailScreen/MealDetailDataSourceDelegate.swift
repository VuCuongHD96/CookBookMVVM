//
//  MealDetailDataSourceDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit

final class MealDetailDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let headerHeight: CGFloat = 30
    }
    
    // MARK: - Property
    var listInstruction = [String]()
    var listIngredient = [FoodResource]()
    
    init(listInstruction: [String], listIngredient: [FoodResource]) {
        self.listInstruction = listInstruction
        self.listIngredient = listIngredient
    }
}

extension MealDetailDataSourceDelegate: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return listIngredient.count
        case 1:
            return listInstruction.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        switch section {
        case 0:
            let data = listIngredient[row]
            let cell: IngredientCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(data: data)
            return cell
        case 1:
            let data = listInstruction[row]
            let cell: InstructionCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(data: data, index: row)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension MealDetailDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: HeaderCell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: section))
        var title = ""
        switch section {
        case 0:
            title = "INGREDIENTS"
        case 1:
            title = "INSTRUCTIONS"
        default:
            break
        }
        cell.setContent(data: title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
