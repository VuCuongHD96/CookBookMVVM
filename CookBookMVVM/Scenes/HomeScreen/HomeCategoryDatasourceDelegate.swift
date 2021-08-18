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
    typealias CategoryHandler = (Category) -> Void
    
    // MARK: - Property
    var categoryArray = [Category]()
    var didSelectCategory: CategoryHandler?
    
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
        let row = indexPath.row
        let category = categoryArray[row]
        
        let cell: CategoryImageCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: category)
        return cell
    }
}

extension HomeCategoryDatasourceDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let category = categoryArray[row] 
        didSelectCategory?(category)
    }
}

extension HomeCategoryDatasourceDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.cellWidth, height: Constant.cellHeight)
    }
}
