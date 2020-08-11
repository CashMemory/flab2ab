//
//  WorkoutViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/30/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    //MARK: - Properties
    
    var workout = Workout()
    var delegate: AddToMyWorkoutsProtocol? = nil
    
    @IBOutlet weak var workoutTitle: UITextField!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func workoutTitleEdited(_ sender: UITextField) {
        workout.title = sender.text!
        print(workout.title)
    }

    @IBAction func addExercisePressed(_ sender: UIButton) {
        addNewExercisePopup()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if self.delegate != nil {
            self.delegate?.addToMyWorkouts(workout)
        }
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutTitle.text = workout.title
        
        configureTableView()
    }
    
    //MARK: - Private Methods

    fileprivate func addExerciseToWorkout(_ workoutName: String) {
        workout.addExercise(name: workoutName)

        let indexSet = IndexSet(arrayLiteral: self.workout.exercises.count - 1)
        tableView.beginUpdates()
        tableView.insertSections(indexSet, with: .automatic)
        tableView.endUpdates()
    }

    private func addNewExercisePopup() {
        let ac = UIAlertController(title: "Exercise name", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
            if let workoutName = ac.textFields![0].text {
                self.addExerciseToWorkout(workoutName)
            }
        }

        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(ac, animated: true)
    }
    
    private func configureTableView() {
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        tableView.register(ExerciseHeader.self, forHeaderFooterViewReuseIdentifier: K.identifiers.exerciseHeader)
        tableView.register(ExerciseFooter.self, forHeaderFooterViewReuseIdentifier: K.identifiers.exerciseFooter)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.keyboardDismissMode = .onDrag
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}

//MARK: - Extensions

extension WorkoutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as! ExerciseTableViewCell
        
        cell.configure(set: workout.exercises[indexPath.section].sets[indexPath.row])
        
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workout.exercises.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.exercises[section].sets.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    // section customization
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: K.identifiers.exerciseHeader) as! ExerciseHeader
        view.title.text = workout.exercises[section].name
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: K.identifiers.exerciseFooter) as! ExerciseFooter
        
        view.addSetAction = { [unowned self] in
            self.workout.exercises[section].addSet()
            let indexPath = IndexPath(row: self.workout.exercises[section].sets.count - 1, section: section)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
        
        view.removeSetAction = { [unowned self] in
            let indexPath = IndexPath(row: self.workout.exercises[section].sets.count - 1, section: section)
            self.workout.exercises[section].removeSet()
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
        
        return view
    }

}

//MARK: - Protocols

protocol AddToMyWorkoutsProtocol {
    func addToMyWorkouts(_ workout: Workout)
}
