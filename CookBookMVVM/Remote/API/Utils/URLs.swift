//
//  URLs.swift
//  Movie

struct URLs {
    private static let APIBaseUrl = "https://www.themealdb.com/api/json/v1/1/"
    static let categories = APIBaseUrl + "categories.php"
    static let meals = APIBaseUrl + "search.php?s"
    static let mealByCategory = APIBaseUrl + "filter.php?c="
    static let mealByID = APIBaseUrl + "lookup.php?i="
    static let allMeal = APIBaseUrl + "search.php?s"
}
