//
//  AddPostVC.swift
//  Fav-Notes
//
//  Created by Mc on 5/4/16.
//  Copyright © 2016 Good Rock Apps LLC. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.size.width /  2
        
        //imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        titleField.delegate = self

        descriptionField.delegate = self
        
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //textField code
        
        descriptionField.resignFirstResponder() //if desired
         titleField.resignFirstResponder()
        performAction()
        return true
    }
    
    func performAction() {
        descriptionField.endEditing(true)
titleField.endEditing(true)
        //action events
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

        
        
        
    }
    
    @IBAction func postNewNote(sender: UIButton) {
        
        if let title = titleField.text, let desc = descriptionField.text, let img = imageView.image {
            
            let imagePath = dataservice.instance.saveIMageAndCreatePath(img)
            let post  = Post(imagePath: imagePath, title: title, desc: desc)
            dataservice.instance.addPost(post)
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)

        
    }
    
    @IBAction func addPicButtonPressed(sender: UIButton) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)

        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = image
        
        
        
    }
    
}
