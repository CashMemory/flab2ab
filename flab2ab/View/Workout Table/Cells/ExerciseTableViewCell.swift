//
//  ExerciseTableViewCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/6/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet var setLabel: UILabel!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    static let identifier = "ExerciseTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(set: ExerciseSet) {
        setLabel.text = "SET \(set.setNumber)"
        repsTextField.text = "\(set.reps)"
        weightTextField.text = "\(set.weight)"
    }
}


