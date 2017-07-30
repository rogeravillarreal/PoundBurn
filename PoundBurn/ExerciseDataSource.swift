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
        
        let walking = Exercise()
        walking.name = "Walking"
        walking.image = #imageLiteral(resourceName: "walking 2")
        walking.mets = 3.5
        allExercises.append(walking)
        
//        let walkingUphill15 = Exercise()
//        walkingUphill15.name = "Walk(6-15% slope)"
//        // need to change icon
//        walkingUphill15.image = #imageLiteral(resourceName: "white")
//        walkingUphill15.mets = 8.0
//        allExercises.append(walkingUphill15)
//        
//        let walkingUphill5 = Exercise()
//        walkingUphill5.name = "Walk(1-5% slope)"
//        // need to change icon
//        walkingUphill5.image = #imageLiteral(resourceName: "icons8-Walking")
//        walkingUphill5.mets = 5.3
//        allExercises.append(walkingUphill5)
        
        let jogging = Exercise()
        jogging.name = "Jogging"
        jogging.image = #imageLiteral(resourceName: "jogging")
        jogging.mets = 7.0
        allExercises.append(jogging)
        
        let running = Exercise()
        running.name = "Running"
        running.image = #imageLiteral(resourceName: "running")
        running.mets = 8.0
        allExercises.append(running)
        
        let runningUpStairs = Exercise()
        runningUpStairs.name = "Run up Stairs"
        runningUpStairs.image = #imageLiteral(resourceName: "running up stairs")
        runningUpStairs.mets = 15.0
        allExercises.append(runningUpStairs)
        
        let sprinting = Exercise()
        sprinting.name = "Sprinting"
        sprinting.image = #imageLiteral(resourceName: "sprint 3")
        sprinting.mets = 23.0
        allExercises.append(sprinting)
        
        let stairClimbing = Exercise()
        stairClimbing.name = "Stairs"
        stairClimbing.image = #imageLiteral(resourceName: "stairs")
        stairClimbing.mets = 8.0
        allExercises.append(stairClimbing)
        
        let biking = Exercise()
        biking.name = "Biking"
        biking.image = #imageLiteral(resourceName: "biking")
        biking.mets = 7.5
        allExercises.append(biking)
        
        let swimming = Exercise()
        swimming.name = "Swimming"
        swimming.image = #imageLiteral(resourceName: "swimmer")
        swimming.mets = 6.0
        allExercises.append(swimming)
        
        let jumpRope = Exercise()
        jumpRope.name = "Jump Rope"
        jumpRope.image = #imageLiteral(resourceName: "jump rope 2")
        jumpRope.mets = 12.3
        allExercises.append(jumpRope)
        
        let jumpingJacks = Exercise()
        jumpingJacks.name = "Jumping Jacks"
        jumpingJacks.image = #imageLiteral(resourceName: "jumping jacks")
        jumpingJacks.mets = 3.8
        allExercises.append(jumpingJacks)
        
        let elliptical = Exercise()
        elliptical.name = "Elliptical"
        elliptical.image = #imageLiteral(resourceName: "elliptical")
        elliptical.mets = 5.0
        allExercises.append(elliptical)
        
        let stepMill = Exercise()
        stepMill.name = "Step Mill"
        stepMill.image = #imageLiteral(resourceName: "stepper")
        stepMill.mets = 9.0
        allExercises.append(stepMill)
        
        let stationaryBike = Exercise()
        stationaryBike.name = "Stationary Bike"
        stationaryBike.image = #imageLiteral(resourceName: "stationary bike")
        stationaryBike.mets = 9.0
        allExercises.append(stationaryBike)
        
        let rowingMachine = Exercise()
        rowingMachine.name = "Row Machine"
        rowingMachine.image = #imageLiteral(resourceName: "rowing")
        rowingMachine.mets = 4.8
        allExercises.append(rowingMachine)
        
        let yoga = Exercise()
        yoga.name = "Yoga"
        yoga.image = #imageLiteral(resourceName: "yoga")
        yoga.mets = 3.0
        allExercises.append(yoga)
        
        let pilates = Exercise()
        pilates.name = "Pilates"
        pilates.image = #imageLiteral(resourceName: "pilates")
        pilates.mets = 3.0
        allExercises.append(pilates)
        
        let boxing = Exercise()
        boxing.name = "Boxing"
        boxing.image = #imageLiteral(resourceName: "boxing")
        boxing.mets = 12.8
        allExercises.append(boxing)
        
        let rollerSkating = Exercise()
        rollerSkating.name = "RollerSkating"
        rollerSkating.image = #imageLiteral(resourceName: "roller skater")
        rollerSkating.mets = 7.0
        allExercises.append(rollerSkating)
        
        let iceSkating = Exercise()
        iceSkating.name = "IceSkating"
        iceSkating.image = #imageLiteral(resourceName: "ice skating")
        iceSkating.mets = 7.0
        allExercises.append(iceSkating)
        
        let dancing = Exercise()
        dancing.name = "Dancing"
        dancing.image = #imageLiteral(resourceName: "dancing")
        dancing.mets = 7.8
        allExercises.append(dancing)
        
        let basketball = Exercise()
        basketball.name = "Basketball"
        basketball.image = #imageLiteral(resourceName: "basketball")
        basketball.mets = 6.7
        allExercises.append(basketball)
        
        let football = Exercise()
        football.name = "Football"
        football.image = #imageLiteral(resourceName: "football")
        football.mets = 8.0
        allExercises.append(football)
        
        let baseball = Exercise()
        baseball.name = "Baseball"
        baseball.image = #imageLiteral(resourceName: "baseball")
        baseball.mets = 5.0
        allExercises.append(baseball)
        
        let martialArts = Exercise()
        martialArts.name = "MartialArts"
        martialArts.image = #imageLiteral(resourceName: "martial arts")
        martialArts.mets = 5.3
        allExercises.append(martialArts)
        
        let soccer = Exercise()
        soccer.name = "Soccer"
        soccer.image = #imageLiteral(resourceName: "soccer")
        soccer.mets = 7.0
        allExercises.append(soccer)
        
        let tennis = Exercise()
        tennis.name = "Tennis"
        tennis.image = #imageLiteral(resourceName: "tennis")
        tennis.mets = 7.3
        allExercises.append(tennis)
        
        let volleyball = Exercise()
        volleyball.name = "Volleyball"
        volleyball.image = #imageLiteral(resourceName: "volleyball 2")
        volleyball.mets = 4.0
        allExercises.append(volleyball)

        
        let hiking = Exercise()
        hiking.name = "Hiking"
        hiking.image = #imageLiteral(resourceName: "hiking")
        hiking.mets = 6.0
        allExercises.append(hiking)
        
        let mountainBiking = Exercise()
        mountainBiking.name = "Mountain Biking"
        mountainBiking.image = #imageLiteral(resourceName: "mountain biking-1")
        mountainBiking.mets = 8.5
        allExercises.append(mountainBiking)
        
        let rockClimbing = Exercise()
        rockClimbing.name = "Rock Climbing"
        rockClimbing.image = #imageLiteral(resourceName: "rock climbing")
        rockClimbing.mets = 5.8
        allExercises.append(rockClimbing)
        
        let ballet = Exercise()
        ballet.name = "Ballet"
        ballet.image = #imageLiteral(resourceName: "ballet")
        ballet.mets = 5.8
        allExercises.append(ballet)

    }
    
    // Add function to createExercise()
    @discardableResult func createExercise() -> Exercise {
        let newExercise = Exercise()
        allExercises.append(newExercise)
        return newExercise
    }
}
