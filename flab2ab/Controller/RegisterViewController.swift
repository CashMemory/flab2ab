//
//  RegisterViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 7/22/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // TODO: present user with error
                if let e = error {
                    print(e)
                }
                else {
                    self.performSegue(withIdentifier: "RegisterToHome", sender: self)
                }
            }
        }
    }
}
