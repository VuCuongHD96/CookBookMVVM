//
//  CategoriesRequest.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation

class CategoriesRequest: BaseRequest {
    required init() {
        let body: [String: Any] = [:]
        let url = URLs.categories
        super.init(url: url, requestType: .get, body: body)
    }
}
