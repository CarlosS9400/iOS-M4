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
        
        VStack (alignment: .leading, spacing: 0) {
            Spacer()
            Text("Featured Dishes")
                .padding()
                .padding(.top)
                .font(.largeTitle)
                .bold()
                
            GeometryReader{ geo in
                TabView {
                    
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    
                                VStack(spacing: 0){
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    
                                    Text(model.recipes[index].name).padding([.top, .bottom])
                                        .font(.headline)
                                    
                                    
                                        
                                }
                                
                            }.frame(width: geo.size.width-50, height: geo.size.height-100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.4)), radius: 15, x: -5, y: -2)
                                
                        }
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .padding([.leading, .top], 3)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
                   
                    
            }
            
            VStack(alignment: .leading){
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
                    
            }.padding(.leading, 20)
                .padding(.bottom, 20)
            
            Spacer()
                
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
        .environmentObject(RecipeModel())
    }
}
