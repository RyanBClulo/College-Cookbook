//
//  recipeObject.swift
//  College_Cookbook
//
//  Created by Jason Wallenfang on 4/24/17.
//  Copyright © 2017 CollegeCB_Team. All rights reserved.
//

import Foundation

class recipeObject{
    var title:String?
    var ingrediants:String?
    var steps:String?
    
    init(titleInput:String, ingrediantsInput:String, stepsInput:String){
        title = titleInput
        ingrediants = ingrediantsInput
        steps = stepsInput
    }
}
