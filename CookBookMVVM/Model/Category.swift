//
//  Category.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation
import ObjectMapper

struct Category {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}

extension Category {
    init() {
        idCategory = ""
        strCategory = ""
        strCategoryThumb = ""
        strCategoryDescription = ""
    }
}

extension Category: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        idCategory <- map["idCategory"]
        strCategory <- map["strCategory"]
        strCategoryThumb <- map["strCategoryThumb"]
        strCategoryDescription <- map["strCategoryDescription"]
    }
}
