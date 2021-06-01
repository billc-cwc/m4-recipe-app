//
//  RecipeModel.swift
//  M4 Recipe App
//
//  Created by Bill on 5/29/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {

        // create an instance of DataService and get the data
        let service = DataService()
        self.recipes = service.getLocalData()
        
        // Note - above could be shortened to the following if we modify getLocalData to be
        // static, as in: static func getLocalData() -> [Recipe] ... and then this:
        
        // self.recipes=DataService.getLocalData()
        
        // This does NOT create an instance of DataService since there's no need for it.
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion:String = ""
        var numerator:Int = ingredient.num ?? 1
        var denominator:Int = ingredient.denom ?? 1
        var whole:Int = 0
        
        
        if ingredient.num != nil {
            // Get single serving size by multiplying denom by recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying num by target servings
            numerator *= targetServings
            
            // Reduce fraction by dividing num and denom by greatest common divisor
            let gcd = greatestCommonDivisor(numerator, denominator)
            numerator /= gcd
            denominator /= gcd
            
            // Get the whole portion if num > denom
            if numerator >= denominator {
                whole = numerator / denominator
                numerator = numerator % denominator
                portion += "\(whole)"
            }
            
            // Express remainder as fraction
            if denominator > 1 {
                portion += (whole > 0) ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if ingredient.unit != nil {
            portion += ((whole > 0) || (denominator > 1)) ? " " : ""
            portion += ingredient.unit!
            if ((whole == 1) && (denominator > 1)) || (whole > 1) {
                portion  += "s"
            }
        }
        
        
        
        return portion
    }
    
    static func greatestCommonDivisor(_ a:Int, _ b:Int) -> Int {
        if a == 0 { return b }
        if b == 0 { return a }
        return greatestCommonDivisor(b, a % b)
    }
    
}
