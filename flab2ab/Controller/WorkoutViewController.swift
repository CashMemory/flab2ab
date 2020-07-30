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
        showNewExerciseDialog()
    }
    
    func showNewExerciseDialog() {
        
        let popupVC = PopupTextfieldViewController(nibName: "PopupTextfieldViewController", bundle: nil)
        
        // Create the dialog
        let popup = PopupDialog(viewController: popupVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: true,
                                hideStatusBar: true) {
                                    print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancel") {
//            self.label.text = "You canceled the default dialog"
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "Add") {
//            self.label.text = "You ok'd the default dialog"
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}
