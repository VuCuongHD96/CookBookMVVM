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
}

extension MealDetailDataSourceDelegate: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            let cell: IngredientCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: InstructionCell = tableView.dequeueReusableCell(for: indexPath)
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
