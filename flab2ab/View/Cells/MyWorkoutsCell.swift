//
//  MyWorkoutsCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/11/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class MyWorkoutsCell: UITableViewCell {
    
    var delegate: StartWorkoutDelegate? = nil
    var workout: Workout? = nil {
        didSet {
            workoutTitleLabel.text = workout?.title
        }
    }
    
    @IBOutlet weak var workoutTitleLabel: UILabel!
    @IBAction func startWorkoutTapped(_ sender: UIButton) {
        if let w = workout {
            delegate?.didTapStartWorkout(w)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK: - Protocols

protocol StartWorkoutDelegate {
    func didTapStartWorkout(_ workout: Workout)
}
