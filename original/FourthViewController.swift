//
//  FourthViewController.swift
//  original
//
//  Created by 李優佳 on 2020/01/02.
//  Copyright © 2020 李優佳. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var cameraView : UIImageView!
    @IBOutlet var label : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Tap the [start] to take a picture"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startCamera(_ sender : AnyObject) {
        
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
        
            let camerPicker = UIImagePickerController()
            camerPicker.sourceType = sourceType
            camerPicker.delegate = self
            self.present(camerPicker, animated: true, completion: nil)
            
    }
        else{
            label.text = "error"
        }
        
    }
    
    func imagePickerController(_ imagePicker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage = info[.originalImage]
            as? UIImage {
            
            cameraView.contentMode = .scaleAspectFit
            cameraView.image = pickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
    }
    
    @IBAction func savePicture(_ sender : AnyObject) {
        let image:UIImage! = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(
                image,
                self,
                #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)),
                nil)
        }
        else{
            label.text = "image Failed !"
        }
    }
    
    @objc func image(_ image:UIImage,
                     didFinishSavingWithError error:NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "SaveSucceeded"
        }
    }
    
    @IBAction func showAlbum(_ sender : AnyObject) {
        let sourceType:UIImagePickerController.SourceType =
        UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            label.text = "Tap the [start] to save a picture"
        }
        else{
            label.text = "error"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}
