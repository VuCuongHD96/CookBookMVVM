//
//  MealResponse.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation
import ObjectMapper

class MealResponse: Mappable {
    var meals = [Meal]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        meals <- map["meals"]
    }
}
