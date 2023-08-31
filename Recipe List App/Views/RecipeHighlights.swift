//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Carlos Dos santos on 30/08/2023.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHightlighs = ""
    
    init(highlights:[String]){
        
        for index in 0..<highlights.count {
            if index == highlights.count-1 {
                allHightlighs += highlights[index]
            } else {
                allHightlighs += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHightlighs)
    }
    
    
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["a","b","b"])
    }
}
