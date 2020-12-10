//
//  TempWorkoutViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 9/22/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

struct exercise {
    let title: String
    let reps: String
}

class TempWorkoutViewController: UIViewController {
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var workoutTimer = Timer()
    var startDate: Date?
    var exercises: [exercise] = []
    
    override func viewDidLoad() {
        configureTimer()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ExerciseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ExerciseTableViewCell")
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func configureTimer() {
        startDate = Date()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(sender: UIBarButtonItem) {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let diff = calendar.dateComponents([.hour, .minute, .second], from: startDate!, to: currentDate)
        timer.text = String(format: "%02d:%02d:%02d", diff.hour!, diff.minute!, diff.second!)
    }
    
}

extension TempWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell", for: indexPath) as! ExerciseTableViewCell
        cell.ExerciseTitleLabel?.text = exercises[indexPath.row].title
        cell.RepsLabel?.text = exercises[indexPath.row].reps
        
        return cell
    }
}
