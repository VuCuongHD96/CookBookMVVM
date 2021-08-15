//
//  HeaderCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable

final class HeaderCell: UITableViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Data
    func setContent(data: String) {
        titleLabel.text = data
    }
}
