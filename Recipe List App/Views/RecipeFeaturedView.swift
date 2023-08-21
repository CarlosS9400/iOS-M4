//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Carlos Dos santos on 21/08/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    var body: some View {
        Text("Featured Recipe!")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
