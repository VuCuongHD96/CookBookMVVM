//
//  MealRequest.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation

final class MealRequest: BaseRequest {
    required init(categoryName: String) {
        let body: [String: Any] = [:]
        let url = URLs.mealByCategory + categoryName
        super.init(url: url, requestType: .get, body: body)
    }
    
    required init(id: String) {
        let body: [String: Any] = [:]
        let url = URLs.mealByID
        super.init(url: url, requestType: .get, body: body)
    }
}
