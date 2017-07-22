//
//  ViewController.swift
//  CalorieCalc
//
//  Created by Roger Villarreal on 5/15/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let allExercises = ExerciseDataSource().allExercises
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var poundLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    @IBOutlet var weightButton: UIButton!
    @IBOutlet var poundsButton: UIButton!
    
    
    var valueWeight = 150.0
    var valuePounds = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kilogram = valueWeight / 2.2
        
        let excercise = allExercises[indexPath.row]
        
        let timeInHours = excercise.calculateTimeInHours(mets: excercise.mets, kilogram: kilogram, pounds: valuePounds)
        
        var totalTime = ""
        
        if !timeInHours.isNaN && !timeInHours.isInfinite && timeInHours > 0 {
            totalTime =  displayTotalTime(time: timeInHours)
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell",
                                                       for: indexPath) as? ExerciseTableViewCell else { return UITableViewCell() }
        cell.exerciseName.text = excercise.name + " = "
        cell.timeToBurn.text = totalTime
        cell.exerciseImage.image = excercise.image
        
        return cell
        
    }
    
    func displayTotalTime(time : Double) -> String {
        let hours: Int = Int(time)
        
        let hoursInDecimals = NumberFormatter.localizedString(from: NSNumber(value: hours), number: NumberFormatter.Style.decimal)
        
        let min: Double = time - Double(hours)
        let minLeftOver = Int(Double(min) * 60)
        return "\(hoursInDecimals) hr \(minLeftOver) min"
    }
    
    @IBAction func poundsButtonTapped(_ sender: UIButton) {
        
        let tappedColor = UIColor(red: 85/255, green: 130/255, blue: 176/255, alpha: 1.0)
        poundsButton.setTitleColor(tappedColor, for: .normal)
        weightButton.setTitleColor(.white, for: .normal)
        poundsButton.setBackgroundImage(#imageLiteral(resourceName: "tapped-circle-darkblue-1"), for: .selected)
        
        weightButton.isSelected = false
        sender.isSelected = true
        stepper.value = valuePounds
    }
    
    @IBAction func weightButtonTapped(_ sender: UIButton) {
        
        let tappedColor = UIColor(red: 85/255, green: 130/255, blue: 176/255, alpha: 1.0)
        weightButton.setTitleColor(tappedColor, for: .normal)
        poundsButton.setTitleColor(.white, for: .normal)
        weightButton.setBackgroundImage(#imageLiteral(resourceName: "tapped-circle-darkblue-1"), for: .selected)
        poundsButton.isSelected = false
        sender.isSelected = true
        stepper.value = valueWeight
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        // check to see if button is selected
        // if it is, do the following:
        // get integer from text label
        // add the stepper increment to that integer
        // set the text label to that number
        
        if weightButton.isSelected {
            // set weight label to the stepper value
            valueWeight = sender.value
            weightButton.setTitle(String(Int(valueWeight)), for: .normal)
            //            weightLabel.text = String(Int(sender.value))
            //            valueWeight = Double(weightLabel.text!)!
        }
        
        if poundsButton.isSelected {
            // set pound label to the stepper value
            //            poundLabel.text = String(Int(sender.value))
            //            valuePounds = Double(poundLabel.text!)!
            valuePounds = sender.value
            poundsButton.setTitle(String(Int(valuePounds)), for: .normal)
        }
        tableView.reloadData()
    }
    
}






