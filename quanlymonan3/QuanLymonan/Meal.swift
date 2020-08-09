//
//  Meal.swift
//  QuanLymonan
//
//  Created by CNTT on 6/29/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import Foundation
import UIKit

class Meal{
    private var name: String
    private var image: UIImage?
    private var rating: Int
    
    init?(name: String, image: UIImage?, rating: Int) {
        guard !name.isEmpty else{
            return nil
        }
        
        guard rating >= 0 || rating <= 5 else{
            return nil
        }
        
        
        self.name = name
        self.image = image
        self.rating = rating
        
    }
}
