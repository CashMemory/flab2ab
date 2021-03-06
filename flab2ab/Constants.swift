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
    static let localhost = "http://10.56.52.237:5000/"
//    static let localhost = "https://run.mocky.io/v3/0f147e61-281b-46ff-832e-c872c8453a4f"
    static let firestoreUrl = "https://us-central1-flab2ab-9aa39.cloudfunctions.net/app"
    static let userId = "1lWXVwHmUveyz9vGHEWh"
    
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
        "Bicep Curl",
        "Shoulder Press",
        "Squat",
        "Debug"
    ]
    
}
