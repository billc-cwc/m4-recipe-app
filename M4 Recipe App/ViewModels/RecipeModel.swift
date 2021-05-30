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
    
}
