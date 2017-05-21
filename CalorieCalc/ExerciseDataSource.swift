//
//  ExerciseDataSource.swift
//  CalorieCalc
//
//  Created by Roger Villarreal on 5/21/17.
//
//

import UIKit

class ExerciseDataSource {
    
    var allExercises: [Exercise] = []

    init() {
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
}