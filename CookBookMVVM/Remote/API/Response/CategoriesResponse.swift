//
//  CategoriesResponse.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation
import ObjectMapper

class CategoriesResponse: Mappable {
    var categories = [Category]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        categories <- map["categories"]
    }
}
