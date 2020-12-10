//
//  ExerciseViewController.swift
//  flab2ab
//
//  Created by Tyler Linquata on 9/13/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    var exerciseTitle = "";
    var reps = 0;
    @IBOutlet weak var repsTextField: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            self.requestReps();
        }
        repsTextField.text = "0"
    }
    
    func setTitle(title: String) {
        self.navigationItem.title = title
        exerciseTitle = title;
    }
    
    private func replayVideoPopup() {
        let ac = UIAlertController(title: "Review video?", message: nil, preferredStyle: .alert)
        
        let submitAction = UIAlertAction(title: "Yes", style: .default) { [unowned ac] _ in
            print("replay video")
            // if yes, send request to replay video
            self.exitExercise()
        }
        
        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "No", style: .cancel) { [unowned ac] _ in
            print("replay video")
            // if yes, send request to replay video
            self.exitExercise()
        })
        
        present(ac, animated: true)
    }
    
    @IBAction func didTapComplete(_ sender: UIButton) {
        if let url = URL(string: K.localhost + "endExercise") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                } else {
                    print("start")
                }
            }
            task.resume();
        }
        timer?.invalidate()
        // send request to firestore
//        if let url = URL(string: K.firestoreUrl + "/user/" + K.userId) {
//            let session = URLSession(configuration: .default)
//            var request = URLRequest(url: url)
//            request.httpMethod = "PUT"
//            let json: [String: Any] = [
//                "exercise": self.exerciseTitle,
//                "reps": 5
//            ]
//            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
//            let task = session.uploadTask(with: request, from: jsonData) {(data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                } else {
//                    print(data?.base64EncodedString())
//                }
//            }
//            task.resume();
//        }
        
//        replayVideoPopup()
        exitExercise()
    }
    
    func requestReps() {
        if let url = URL(string: K.localhost + "repCount") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                } else {
                    if let safeData = data {
                        let dataString = String(data: safeData, encoding: .utf8)
                        self.parseJSON(repData: safeData)
                    }
              
                }
            }
            task.resume();
        }
    }
    
    func parseJSON(repData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RepData.self, from: repData)
            let queue = DispatchQueue(label: "update")
            DispatchQueue.main.async {
                self.repsTextField.text = decodedData.repCount
            }
        } catch {
            print(error)
        }
    }
    
    func exitExercise() {
        self.navigationController?.popViewController(animated: true)
        let vc = self.navigationController?.viewControllers[1]
        if vc is TempWorkoutViewController {
            let workoutVc = vc as! TempWorkoutViewController
            workoutVc.exercises.append(exercise(title: exerciseTitle, reps: repsTextField.text!))
            workoutVc.tableView.reloadData()
            print(workoutVc.exercises)
            self.navigationController?.popToViewController(workoutVc, animated: true)
        }
    }

}
