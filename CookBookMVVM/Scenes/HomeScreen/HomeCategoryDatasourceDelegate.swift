//
//  HomeCategoryDatasourceDelegate.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import UIKit

final class HomeCategoryDatasourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 128
        static let cellWidth: CGFloat = 208
    }
    
    // MARK: - Property
    var categoryArray = [Category]()
    
    init(categoryArray: [Category]) {
        self.categoryArray = categoryArray
    }
}

extension HomeCategoryDatasourceDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryImageCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension HomeCategoryDatasourceDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.cellWidth, height: Constant.cellHeight)
    }
}
