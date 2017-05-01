//
//  recipeObject.swift
//  College_Cookbook
//
//  Created by Jason Wallenfang on 4/24/17.
//  Copyright © 2017 CollegeCB_Team. All rights reserved.
//

import Foundation

class recipeObject{
    var title:Array<Any>?
    var ingrediants:Array<Any>?
    var steps:Array<Any>?
    
    init(titleInput:Array<Any>, ingrediantsInput:Array<Any>, stepsInput:Array<Any>){
        title = titleInput
        ingrediants = ingrediantsInput
        steps = stepsInput
    }
}
