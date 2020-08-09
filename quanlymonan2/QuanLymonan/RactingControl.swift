//
//  RactingControl.swift
//  QuanLymonan
//
//  Created by CNTT on 6/22/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RactingControl: UIStackView {
    //kkhai bao mang
    
    private var rating = 0
    private var arrayButton = [UIButton]()
    @IBInspectable var buttonCount:Int = 5
    {
        didSet{
            settupButtons()
        }
    }
    @IBInspectable var buttonSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            settupButtons()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        settupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        settupButtons()
    }
    
    private func settupButtons(){
        
        
        for _ in 0..<buttonCount{
//        print("quy dep trai")
        
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        
        button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
        
        
        addArrangedSubview(	button)
            
            arrayButton.append(button)
        }
    }
    @objc func ratingButtonPressed(button: UIButton){
        
        print("quy dep trai")
    }
}
