//
//  ViewController.swift
//  CalorieCalc
//
//  Created by Roger Villarreal on 5/15/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var poundsTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var allExercises: [Exercise] = []
    
    var valueWeight = 0.0
    var valuePounds = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.weightTextField.delegate = self
        self.poundsTextField.delegate = self
        
        // dummy object
        let treadmill = Exercise()
        treadmill.name = "Treadmill"
        treadmill.image = #imageLiteral(resourceName: "treadmill@1x.png")
        treadmill.mets = 8
        allExercises.append(treadmill)
        
        let elliptical = Exercise()
        elliptical.name = "Elliptical"
        elliptical.image = #imageLiteral(resourceName: "eliptical@1x.png")
        elliptical.mets = 9
        allExercises.append(elliptical)
        
    }
    
    @IBAction func weightEditing(_ sender: Any) {
        // when weight has been changed update talbeview
        tableView.reloadData()
    }
    
    @IBAction func poundsEditing(_ sender: Any) {
        // when pounds has been changed update talbeview
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        

        
        // if either text fields is empty, set value to 0
        if (weightTextField.text?.isEmpty)! || (poundsTextField.text?.isEmpty)! {
            valueWeight = 0
            valuePounds = 0
        } else {
            valueWeight = Double(weightTextField.text!)!
            valuePounds = Double(poundsTextField.text!)!
        }
        
        let userWeight = valueWeight
        let poundsBurn = valuePounds
        
        let kilogram = userWeight / 2.2
        
        let excercise = allExercises[indexPath.row]

        // equation (3500/METS)/kg = Time in hours
        let timeInHours = Double(3500/excercise.mets) / Double(kilogram) * poundsBurn
        
        let cell = UITableViewCell()
        
        
        cell.textLabel?.text = excercise.name
        cell.detailTextLabel?.text = "\(timeInHours)"
        cell.imageView?.image = excercise.image
        return cell
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        weightTextField.resignFirstResponder()
        poundsTextField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //     This Allow only numbers and one decimal point in textFields
        let weightTextHasDecimalSeparator = weightTextField.text?.range(of: ".")
        let poundsTextHasDecimalSeparator = poundsTextField.text?.range(of: ".")
        
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        // This lets one decimal point but also allows alphabetical characters...
        if weightTextHasDecimalSeparator != nil, poundsTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
        
        //        // Should allow only numbers
        //        let allowedCharacters = CharacterSet.decimalDigits
        //        let characterSet = CharacterSet(charactersIn: string)
        //        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}






