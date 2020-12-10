//
//  FirstViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/19/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class MyWorkoutsViewController: UIViewController {
    
    var myWorkouts = MyWorkouts()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "createWorkout" {
//            let workoutVC: CreateWorkoutViewController = segue.destination as! CreateWorkoutViewController
//            workoutVC.delegate = self
//        }
//        else if segue.identifier == K.segues.createWorkoutSegue {
//            let workoutVC: WorkoutViewController = segue.destination as! WorkoutViewController
//            workoutVC.workout = myWorkouts.workouts[(sender as! NSIndexPath).row]
//        }
    }
}

//MARK: - Extensions

//extension MyWorkoutsViewController: AddToMyWorkoutsProtocol {
//    func addToMyWorkouts(_ workout: Workout) {
//        myWorkouts.addWorkout(workout)
//        let indexPath = IndexPath(row: myWorkouts.workouts.count - 1, section: 0)
//        tableView.beginUpdates()
//        tableView.insertRows(at: [indexPath], with: .automatic)
//        tableView.endUpdates()
//    }
//}

extension MyWorkoutsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myWorkouts.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.identifiers.myWorkoutsCell, for: indexPath) as! MyWorkoutsCell
        cell.workout = myWorkouts.workouts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: K.segues.createWorkoutSegue, sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
