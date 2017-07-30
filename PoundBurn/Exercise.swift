//
//  Exercise.swift
//  CalorieCalc
//
//  Created by Roger Villarreal on 5/15/17.
//
//

//import Foundation
import UIKit

class Exercise {
    
    var name = ""
    var mets = 0.0
    var image: UIImage?
    
    func calculateTimeInHours(mets : Double, kilogram : Double, pounds: Double) -> Double {
      return (3500/mets) / kilogram * pounds
    }
    
}
