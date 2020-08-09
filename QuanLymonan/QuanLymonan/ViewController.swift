//
//  ViewController.swift
//  QuanLymonan
//
//  Created by CNTT on 6/15/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var lblHienThi: UILabel!
    
    @IBOutlet weak var txtNhap: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNhap.delegate = self
        
        
        
        
    }
    
    
    @IBAction func gotomap(_ sender: UIButton) {
        lblHienThi.text = txtNhap.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtNhap.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblHienThi.text = txtNhap.text
    }

    
    @IBAction func quydeptrai(_ sender: UITapGestureRecognizer) {
//        print("quy hot boy")
        txtNhap.resignFirstResponder()
        
        let imagepicke = UIImagePickerController()
        
        imagepicke.sourceType = .photoLibrary
        
        imagepicke.delegate = self
        
        present(imagepicke, animated: true, completion: nil)
    }
    
}

