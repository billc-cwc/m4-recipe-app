//
//  RecipeHighlightsView.swift
//  M4 Recipe App
//
//  Created by Bill on 6/1/21.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        
        // Loop through highlights and build the string
        for index in 0..<highlights.count {
            
            // If the last hightlight don't add comma
            allHighlights += highlights[index]
            if index < (highlights.count-1) {
                allHighlights += ", "
            }
        }
        
    }
    
    
    var body: some View {
        
        Text(allHighlights)
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["test1", "test2"])
    }
}
