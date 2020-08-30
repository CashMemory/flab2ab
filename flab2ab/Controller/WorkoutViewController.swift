//
//  WorkoutViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/11/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import Foundation
import UIKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var workoutTimerLabel: UILabel!
    @IBOutlet weak var editWorkoutButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var workout: Workout!
    var workoutTimer = Timer()
    var startDate: Date?
    
    override func viewDidLoad() {
        self.title = workout.title
        configureTableView()
        startDate = Date()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    private func configureTableView() {
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        tableView.register(ExerciseHeader.self, forHeaderFooterViewReuseIdentifier: K.identifiers.exerciseHeader)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.keyboardDismissMode = .onDrag
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func updateTime() {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let diff = calendar.dateComponents([.hour, .minute, .second], from: startDate!, to: currentDate)
        workoutTimerLabel.text = String(format: "%02d:%02d:%02d", diff.hour!, diff.minute!, diff.second!)
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
}
