//
//  Workout.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/31/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation

struct Workout {
    var exercises: [Exercise] = []
    
    mutating func addExercise(name: String) {
        exercises.append(Exercise(name: name))
    }
    
    func getExercises() -> [Exercise] {
        return exercises
    }
}
