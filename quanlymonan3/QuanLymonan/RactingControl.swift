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
    
    @IBInspectable var rating: Int = 0{
        didSet{
            updateButtonStates()
        }
    }
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
        for button in arrayButton{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        arrayButton.removeAll()
        
        //load the setup images button
        let bundle = Bundle(for: type(of: self))
        let normalImage = UIImage(named: "normal", in: bundle, compatibleWith: self.traitCollection)
        let secletedImage = UIImage(named: "selected", in: bundle, compatibleWith: self.traitCollection)
        let highlightedImage = UIImage(named: "highlighted" , in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<buttonCount{
//        print("quy dep trai")
        
        let button = UIButton()
            
            //setup button states
//        button.backgroundColor = UIColor.red
            button.setImage(normalImage, for: .normal)
            button.setImage(secletedImage, for: .selected)
            button.setImage(highlightedImage, for: .highlighted)
            
        button.translatesAutoresizingMaskIntoConstraints = false
            
        button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
            
            
        button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        
        button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
        
        
        addArrangedSubview(	button)
            
            arrayButton.append(button)
        }
        updateButtonStates()
    }
    @objc func ratingButtonPressed(button: UIButton){
        
//        print("quy dep trai")
        guard var selectedIndex = arrayButton.firstIndex(of: button) else{
            fatalError("can not get the button index")
        }
        selectedIndex += 1
        
        if selectedIndex == rating{
            rating -= 1
        }
        else{
            rating = selectedIndex
        }
        //update the states of button
        updateButtonStates()
    }
    func updateButtonStates () {
        for (index, item) in arrayButton.enumerated(){
            item.isSelected = index < rating
        }
    
    }
    
}
