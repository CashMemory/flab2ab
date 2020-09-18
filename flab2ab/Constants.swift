//
//  Constants.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/27/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

struct K {
    static let registerSegue = "RegisterToHome"
    static let loginSegue = "LoginToHome"
    
    struct identifiers {
        static let exerciseCell = "ExerciseCell"
        static let exerciseHeader = "ExerciseHeader"
        static let exerciseFooter = "ExerciseFooter"
        static let myWorkoutsCell = "MyWorkoutsCell"
        static let exerciseSelectCell = "ExerciseSelect"
    }
    
    struct segues {
        static let createWorkoutSegue = "CreateWorkout"
        static let beginWorkoutSegue = "BeginWorkout"
        static let startExerciseSegue = "StartExercise"
    }
    
    struct FStore {
        static let workoutHistoryCollection = "Workout History"
    }
    
    static let availableExercises = [
        "Bicep Curl (Dumbbell)",
        "Shoulder Press (Dumbbell)"
    ]
    
}
