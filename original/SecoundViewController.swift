//
//  SecoundViewController.swift
//  original
//
//  Created by 李優佳 on 2019/11/13.
//  Copyright © 2019 李優佳. All rights reserved.
//

import UIKit
import AVFoundation

class SecoundViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var TextView: UITextView!
//    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var imageview2: UIImageView!
    @IBOutlet var textField: UITextField!
//    @IBOutlet var label: UILabel!
//    @IBOutlet weak var outputText: UILabel!
//    @IBOutlet weak var inputText: UITextField!
    
    var name: String!
    var testText:String = "default"
    

    
    let userDefaults = UserDefaults.standard
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        testText = textField.text!
////        label.text = testText
//        textField.resignFirstResponder()
////        saveData(str: testText)
//        return true
//    }
//
//    func saveData() -> String {
//        let str: String = userDefaults.object(forKey: "DataStore")as!String
//        return str
//    }
//
//    @IBAction func buttonTapped(_ sender : AnyObject){
////        userDefaults.removeObject(forKey: "DataStore")
////        let str: String = userDefaults.object(forKey: "DataStore")as! String
////        label.text = str
//
//    }
    
    @IBAction func save() {
        let title = textField.text!
        let content = TextView.text!
        let image = imageview2!
        userDefaults.set(title, forKey: "title")
        userDefaults.set(content, forKey: "content")
        userDefaults.set(image, forKey: "image")
    }


    @IBAction func plus() {
        
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if name != nil {
            imageview.image = UIImage(named: name!)!
            print(name!)
        }
        
        textField.delegate = self
        
//        UserDefaults.register(["DateStore": "default"])
        
//        label.text = readData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        if name != nil {
            imageview.image = UIImage(named: name!)!
            print(name!)
        }
//        print(name ?? <#default value#>)
        
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
    
    // 撮影が完了した時に呼ばれる
       func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           if let pickedImage = info[.originalImage] as? UIImage {
               imageview2.contentMode = .scaleAspectFit
               imageview2.image = pickedImage
           }
           //閉じる処理
           imagePicker.dismiss(animated: true, completion: nil)
       }
       
       // 撮影がキャンセルされた時に呼ばれる
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        outputText.text = inputText.text
        self.view.endEditing(true)
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
