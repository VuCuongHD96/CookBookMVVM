//
//  Meal.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import Foundation
import ObjectMapper

struct Meal {
    struct Constants {
        static let endArray = 20
    }
        
    var identifier: String
    var name: String
    var imageString: String
    var description: String
    var area: String
    var category: String
    var instructions: String
    var youtubeURL: String
    var resources: [FoodResource]
}

extension Meal {
    init() {
        self.init(
            identifier: "",
            name: "",
            imageString: "",
            description: "",
            area: "",
            category: "",
            instructions: "",
            youtubeURL: "",
            resources: [FoodResource]()
        )
    }
}

extension Meal: Mappable {

    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        identifier <- map["idMeal"]
        name <- map["strMeal"]
        imageString <- map["strMealThumb"]
        description <- map[""]
        area <- map["strArea"]
        category <- map["strCategory"]
        instructions <- map["strInstructions"]
        imageString <- map["strMealThumb"]
        youtubeURL <- map["strYoutube"]
        (1...Constants.endArray).forEach { index in
            var ingredient = ""
            var measure = ""
            ingredient <- map["strIngredient\(index)"]
            measure <- map["strMeasure\(index)"]
            if ingredient != "" {
                resources.append(FoodResource(ingredient: ingredient, measure: measure))
            }
        }
    }
}
