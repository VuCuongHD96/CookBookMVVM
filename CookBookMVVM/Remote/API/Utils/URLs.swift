//
//  URLs.swift
//  Movie

struct URLs {
    private static let APIBaseUrl = "https://www.themealdb.com/api/json/v1/1/"
    static let categories = APIBaseUrl + "categories.php"
    static let meal = APIBaseUrl + "search.php?s"
    static let mealByCategory = APIBaseUrl + "filter.php?c="
}
