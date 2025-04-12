//
//  FirstViewController.swift
//  exercise-calorie-calculator
//
//  Created by Karla Mazariego on 4/11/25.
//

import UIKit

var userAge: Double?
var userWeight: Double?
var userGender: String = "Female"
class FirstViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yourAge.delegate = self
        self.yourWeight.delegate = self
    }
    
    @IBOutlet weak var yourAge: UITextField!
    @IBOutlet weak var yourWeight: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBAction func genderButton(_ sender: Any){
        switch genderControl.selectedSegmentIndex {
        case 0:
            userGender = "Female"
        case 1:
            userGender = "Male"
        default:
            return
        }
    }
    @IBAction func savePersonalInfo(_ sender: Any){
        userWeight = Double(yourWeight.text!)
        userAge = Double(yourAge.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.yourWeight.resignFirstResponder()
        self.yourAge.resignFirstResponder()
        return true
    }
}
