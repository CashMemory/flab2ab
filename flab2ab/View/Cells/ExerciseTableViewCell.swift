//
//  ExerciseTableViewCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/6/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    //MARK: - interface builder
    
    @IBOutlet var setLabel: UILabel!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    @IBAction func repsFieldEdited(_ sender: UITextField) {
        set?.reps = Int(repsTextField.text!)!
    }
    @IBAction func weightFieldEdited(_ sender: UITextField) {
        set?.weight = (weightTextField.text! as NSString).floatValue
    }
    
    //MARK: - properties
    
    var set: ExerciseSet? = nil
    
    static let identifier = "ExerciseTableViewCell"
    
    //MARK: - functions
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.repsTextField.keyboardType = .decimalPad
        self.weightTextField.keyboardType = .decimalPad
    }

    func configure(set: ExerciseSet) {
        self.set = set
        setLabel.text = "SET \(self.set!.setNumber)"
        repsTextField.text = "\(self.set!.reps)"
        weightTextField.text = "\(self.set!.weight)"
    }
}


