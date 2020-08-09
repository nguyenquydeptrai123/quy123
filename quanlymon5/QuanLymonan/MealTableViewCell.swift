//
//  MealTableViewCell.swift
//  QuanLymonan
//
//  Created by CNTT on 7/6/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    //Mark: tinh chat
    
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var mealRatingControl: RactingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
