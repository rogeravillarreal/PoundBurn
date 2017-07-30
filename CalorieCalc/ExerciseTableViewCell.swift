//
//  ExerciseTableViewCell.swift
//  CalorieCalc
//
//  Created by Roger Villarreal on 7/9/17.
//
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet var exerciseImage: UIImageView!
    @IBOutlet var exerciseName: UILabel!
    @IBOutlet var timeToBurn: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
