//
//  ExerciseTableViewCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/6/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet var setLabel: UILabel!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    static let identifier = "ExerciseTableViewCell"
    var set: ExerciseSet!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let thisSet = set {
            self.setLabel?.text = "SET \(thisSet.setNumber)"
            print("SET \(thisSet.setNumber)")
        }
    }

    
}


