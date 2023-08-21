//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Carlos Dos santos on 20/08/2023.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        @State var tabIndex = 0
        TabView (selection: $tabIndex) {
           RecipeFeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }.tag(0)
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Others")
                }.tag(1)
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
