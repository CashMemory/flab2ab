//
//  Workout.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/31/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation

struct Workout {
    var exercises: [Exercise] = [Exercise(name: "push up"), Exercise(name: "squat"), Exercise(name: "deadlift")]
    
    mutating func addExercise(name: String) {
        exercises.append(Exercise(name: name))
    }
    
    func getExercises() -> [Exercise] {
        return exercises
    }
}
