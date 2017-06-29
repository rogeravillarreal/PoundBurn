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
    
    let allExercises = ExerciseDataSource().allExercises
    
    var valueWeight = 0.0
    var valuePounds = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.weightTextField.delegate = self
        self.poundsTextField.delegate = self
        
        
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(gradientLayer)
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
        
        let weight = weightTextField.text!
        let pound  = poundsTextField.text!
        let showHours = !weight.isEmpty && !pound.isEmpty
        
        // if either text fields is empty, set value to 0
        if (weightTextField.text?.isEmpty)! || (poundsTextField.text?.isEmpty)! {
            valueWeight = 0.0
            valuePounds = 0.0
        } else {
            valueWeight = Double(weightTextField.text!)!
            valuePounds = Double(poundsTextField.text!)!
        }
        
        let kilogram = valueWeight / 2.2
        
        let excercise = allExercises[indexPath.row]
        
        let timeInHours = excercise.calculateTimeInHours(mets: excercise.mets, kilogram: kilogram, pounds: valuePounds)
        
        var totalTime = ""
        
        if !timeInHours.isNaN {
            totalTime =  displayTotalTime(time: timeInHours)
        }
        
        //        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
                                                 for: indexPath)
        cell.textLabel?.text = excercise.name
        cell.detailTextLabel?.text = showHours ? totalTime : ""
        cell.imageView?.image = excercise.image
        return cell
        
    }
    
    func displayTotalTime(time : Double) -> String {
        let hours: Int = Int(time)
        let min: Double = time - Double(hours)
        let minLeftOver = Int(Double(min) * 60)
        return "= \(hours) hour \(minLeftOver) min"
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        weightTextField.resignFirstResponder()
        poundsTextField.resignFirstResponder()
    }
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        //     This Allow only numbers and one decimal point in textFields
    //        let weightTextHasDecimalSeparator = weightTextField.text?.range(of: ".")
    //        let poundsTextHasDecimalSeparator = poundsTextField.text?.range(of: ".")
    //
    //        let replacementTextHasDecimalSeparator = string.range(of: ".")
    //
    //        // This lets one decimal point but also allows alphabetical characters...
    //        if weightTextHasDecimalSeparator != nil, poundsTextHasDecimalSeparator != nil,
    //            replacementTextHasDecimalSeparator != nil {
    //            return false
    //        } else {
    //            return true
    //        }
    //    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else {
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
}






