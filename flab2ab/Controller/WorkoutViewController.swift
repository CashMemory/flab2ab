//
//  WorkoutViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/30/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit
import PopupDialog

class WorkoutViewController: UIViewController {

    @IBAction func addExercisePressed(_ sender: Any) {
        addNewExercise()
    }
    
    func addNewExercise() {
        let ac = UIAlertController(title: "Workout name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
            let workoutName = ac.textFields![0]
        }
        
        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
    
}
