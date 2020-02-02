//
//  FourthViewController.swift
//  original
//
//  Created by 李優佳 on 2020/01/02.
//  Copyright © 2020 李優佳. All rights reserved.
//

import UIKit
import AVFoundation

class FourthViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var label : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Tap the [start] to take a picture"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startCamera() {
        print("+ボタンが押されました")
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            
            switch AVCaptureDevice.authorizationStatus(for: .video){
                case .authorized: // The user has previousy granted acess to the camera.
                    self.camera(sourceType: sourceType)
                
                case .notDetermined: //The user has not yet been aasked for camera access.
                    AVCaptureDevice.requestAccess(for: .video) {granted in
                        if granted {
                            print("許可されました")
                            DispatchQueue.main.async{
                                self.camera(sourceType: sourceType)
                            }
                        }else{
                            print("許可されませんでした")
                        }
                   }
            case .denied: // The user has previously denied access.
                DispatchQueue.main.async{
                    self.alert(title: "カメラを使用できません", message:"設定からカメラの使用を許可してください")
                }
                print(".denied")
                return
            case .restricted: // The user can't grant due to restrictions.
                DispatchQueue.main.async{
                    self.alert(title: "カメラを使用できません", message:
                        "設定からカメラの使用を許可してください")
                }
                print(".restricted")
                return
                
            default:
                return
                
                
            }
            
        }else{
            print("エラー")
            self.alert(title: "エラー", message: "カメラが使用できません")
            
            
        }
    }
    
    func camera(sourceType:UIImagePickerController.SourceType){
        //インスタンスの作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    // 撮影が完了した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 写真を保存
    @IBAction func savePicture(_ sender : AnyObject) {
        let image:UIImage! = imageView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(
            image,
            self,
            #selector(FourthViewController.image(_:didFinishSavingWithError:contextInfo:)),
            nil)
        }else{
            alert(title:"エラー", message:"写真が保存できません")
        }
        
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        if error != nil{
            print(error.code)
            alert(title:"エラー", message:"写真の保存に失敗しました")
        }else{
            alert(title: "Success", message: "写真がアルバムに保存されました")
        }
    }
    
    // アルバムの表示
    @IBAction func showAlbum(_ sender : AnyObject) {
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            //インスタンスmの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }else{
            alert(title: "エラー", message: "アルバムの使用を許可してください")
        }
    }
    
    func alert(title: String, message: String){
        print("alert")
        let alert: UIAlertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: { action in
                print("OKが押されました")
        }
        ))
        present(alert, animated: true, completion: nil)
    }


}
