//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
    }
    
    static func getPortion(ingredient: Ingredient, servingSize: Int, targetServingSize: Int)->String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            numerator *= targetServingSize
            denominator *= servingSize
            
            var divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
        }
        
        if numerator >= denominator {
            wholePortions = numerator / denominator
            numerator = numerator % denominator
            
            portion += String(wholePortions)
        }
        
        if numerator > 0 {
            portion += wholePortions > 0 ? " " : ""
            portion += "\(numerator)/\(denominator)"
        }
        
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit+="es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.suffix(1))
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
     
        return portion
    }
}
