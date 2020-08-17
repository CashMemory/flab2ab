//
//  MyWorkoutsCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/11/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class MyWorkoutsCell: UITableViewCell {
    
    var workout: Workout? = nil {
        didSet {
            workoutTitleLabel.text = workout?.title
        }
    }
    
    @IBOutlet weak var workoutTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
