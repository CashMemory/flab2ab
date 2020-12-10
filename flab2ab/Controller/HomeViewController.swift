//
//  HomeViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 9/12/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func beginWorkoutSessionPressed(_ sender: UIButton) {
        if let url = URL(string: K.localhost + "startSession") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                } else {
                    print(response)
                }
            }
            task.resume();
        }
    }
    
}
