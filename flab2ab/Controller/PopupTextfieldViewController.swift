//
//  PopupTextfieldViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/30/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class PopupTextfieldViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
}

extension PopupTextfieldViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
}
