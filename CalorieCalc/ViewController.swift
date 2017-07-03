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
    
    
    var valueWeight = 0.0
    var valuePounds = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kilogram = valueWeight / 2.2
        
        let excercise = allExercises[indexPath.row]
        
        let timeInHours = excercise.calculateTimeInHours(mets: excercise.mets, kilogram: kilogram, pounds: valuePounds)
        
        var totalTime = ""
        
        if !timeInHours.isNaN {
            totalTime =  displayTotalTime(time: timeInHours)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
                                                 for: indexPath)
        cell.textLabel?.text = excercise.name
        cell.detailTextLabel?.text = ""
        cell.imageView?.image = excercise.image
        return cell
        
    }
    
    func displayTotalTime(time : Double) -> String {
        let hours: Int = Int(time)
        let min: Double = time - Double(hours)
        let minLeftOver = Int(Double(min) * 60)
        return "= \(hours) hour \(minLeftOver) min"
    }
    
    @IBAction func poundsButtonTapped(_ sender: UIButton) {
        poundLabel.textColor = UIColor.orange
        weightLabel.textColor = UIColor.white
        weightButton.isSelected = false
        sender.isSelected = true
        print(poundsButton.isSelected)
    }
    
    @IBAction func weightButtonTapped(_ sender: UIButton) {
        weightLabel.textColor = UIColor.orange
        poundLabel.textColor = UIColor.white
        poundsButton.isSelected = false
        sender.isSelected = true
        print(poundsButton.isSelected)
        
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        // check to see if button is selected
        // if it is, do the following:
        // get integer from text label
        // add the stepper increment to that integer
        // set the text label to that number
        if weightButton.isSelected {
            stepper.value = Double(weightLabel.text!)! + 1
            weightLabel.text = String(Int(sender.value))
        }
        
        if poundsButton.isSelected {
            stepper.value = Double(poundLabel.text!)! + 1
            poundLabel.text = String(Int(sender.value))
        }
        
    }
    
}






