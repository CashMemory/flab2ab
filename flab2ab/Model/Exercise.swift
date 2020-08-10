//
//  Exercise.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/31/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation

struct Exercise {
    let name: String
    var sets: [ExerciseSet] = []
    var numberOfSets: Int = 0
    
    mutating func addSet() {
        numberOfSets += 1
        sets.append(ExerciseSet(setNumber: numberOfSets))
    }
    
    mutating func removeSet() {
        numberOfSets -= 1
        sets.removeLast()
    }
}
