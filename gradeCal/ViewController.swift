//
//  ViewController.swift
//  gradeCal
//
//  Created by Manuel Soto on 2/28/18.
//  Copyright © 2018 Manuel Soto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the text fields user input through dlegate callbacks.
        //Self refers to the ViewController Class because its defined within the same scope
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the Keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        classNameLabel.text = textField.text
    }
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        //Hide the Keyboard.
        nameTextField.resignFirstResponder()
        
        //UIImageViewController is a view controller that lets the user pick media from there photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        classNameLabel.text = "Default Text"
    
    }
}

