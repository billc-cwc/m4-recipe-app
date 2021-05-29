//
//  RecipeDetailView.swift
//  M4 Recipe App
//
//  Created by Bill on 5/29/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
            
                // MARK: Recipe Image
                //  Note, the mark lines create handy outline items in the
                //  body section at the top of the edit window. Click on it
                //  to bring down the list. Handy for a long block of code.
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal, 5.0)
                
                // MARK: Divider
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            
                             
                            
                            
                    }
                    
                }
                .padding(.horizontal, 5.0)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
