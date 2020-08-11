//
//  MyWorkouts.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/9/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation

struct MyWorkouts {
    var workouts: [Workout] = []
    
    mutating func addWorkout(_ workout: Workout) {
        workouts.append(workout)
    }
}
