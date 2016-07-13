//
//  CameraViewController.swift
//  Camera
//
//  Created by Toleen Jaradat on 7/13/16.
//  Copyright © 2016 Toleen Jaradat. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    var originalImage :UIImage!

    @IBOutlet weak var cameraButton: UIButton!
    
    @IBAction func cameraButtonPressed(sender: AnyObject) {
        
        cameraButton.hidden = true
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
        
        let pickFromLibraryAction = UIAlertAction(title: "Pick from Library", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
            print("You selected to pick from library")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert :UIAlertAction) in
            
            self.cameraButton.hidden = false
        }
        
        let takeAPictureAction = UIAlertAction(title: "Take a picture", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .Camera
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(pickFromLibraryAction)
        alertController.addAction(takeAPictureAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        self.originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.photoImageView.image = self.originalImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        UIImageWriteToSavedPhotosAlbum(self.originalImage, self, nil, nil);
        
           }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
