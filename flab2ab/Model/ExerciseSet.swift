//
//  Set.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/31/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation

struct ExerciseSet {
    var setNumber: Int = 0
    var reps: Int = 0
    var weight: Float = 0.0
    var complete: Bool = false
    
    //MARK: - Initializers
    
    init(setNumber: Int) {
        self.setNumber = setNumber
    }
    
    mutating public func setReps(reps: Int) {
        self.reps = reps
    }
    
    mutating public func setWeight(weight: Float) {
        self.weight = weight
    }
    
    mutating public func toggleComplete() {
        complete = !complete
    }
}
