//
//  DataService.swift
//  M4 Recipe App
//
//  Created by Bill on 5/29/21.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get url path
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()    // return empty Recipe array
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
                
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Create a json decoder
            let decoder = JSONDecoder()
            
            do {
                
                // Decode the json file into Recipe array
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Assign unique ids to each recipe
                for r in recipeData {
                    r.id = UUID()
                    
                    // Assign unique ids to each ingredient in this recipe
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
                
        return [Recipe]()  // Empty Recipe array, in case we fall through here
        
    }
}
