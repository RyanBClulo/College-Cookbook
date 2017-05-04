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
    var ingrediants:Array<String>?
    var steps:Array<String>?
    
    init(titleInput:String, ingrediantsInput:Array<String>, stepsInput:Array<String>){
        title = titleInput
        ingrediants = ingrediantsInput
        steps = stepsInput
    }
}
