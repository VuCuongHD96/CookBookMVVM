//
//  Category.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation
import ObjectMapper

struct Category {
    var identifier: String
    var name: String
    var imageURL: String
    var description: String
}

extension Category {
    init() {
        identifier = ""
        name = ""
        imageURL = ""
        description = ""
    }
}

extension Category: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        identifier <- map["idCategory"]
        name <- map["strCategory"]
        imageURL <- map["strCategoryThumb"]
        description <- map["strCategoryDescription"]
    }
}
