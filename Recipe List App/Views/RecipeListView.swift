//
//  ContentView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("All Recipe")
                    .padding(.top)
                    .font(.largeTitle)
                    .bold()
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    // MARK: Row item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        
                                        VStack(alignment: .leading){
                                            Text(r.name)
                                                .foregroundColor(.black)
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                            
                                        }
                                        
                                    }
                                    
                                })
                            
                            
                            
                        }
                    }
                }
            }
            .padding(.leading, 20)
            .navigationBarHidden(true)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
