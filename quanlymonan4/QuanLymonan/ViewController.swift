//
//  ViewController.swift
//  QuanLymonan
//
//  Created by CNTT on 6/15/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var txtNhap: UITextField!
    
    @IBOutlet weak var mealimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNhap.delegate = self
        
        
        
        
    }
    
    
    @IBAction func gotomap(_ sender: UIButton) {
//        lblHienThi.text = txtNhap.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtNhap.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        lblHienThi.text = txtNhap.text
    }

    
    @IBAction func quydeptrai(_ sender: UITapGestureRecognizer) {
//        print("quy hot boy")
        txtNhap.resignFirstResponder()
        
        let imagepicke = UIImagePickerController()
        
        imagepicke.sourceType = .photoLibrary
        
        imagepicke.delegate = self
        
        present(imagepicke, animated: true, completion: nil)
    }
    //nut thoat
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: thoat)
        
    }
    
    //chon anh
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
                fatalError("thoat chuong trinh");
        }
        mealimage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    func thoat(){
        let acExit = UIAlertController(title: "xac nhan", message: "ban co muon thoat khong", preferredStyle: UIAlertController.Style.alert)
        
        
        //dong y
        
        acExit.addAction(UIAlertAction(title: "dong y", style: .default, handler: {(action: UIAlertAction! ) in } ))
        
        // cancel
        acExit.addAction(UIAlertAction(title: "khong", style:  .default, handler: {(action: UIAlertAction) in }))
                
        
        //hien thi hop thoai
        
        present(acExit, animated: true, completion: nil)
    }
}

