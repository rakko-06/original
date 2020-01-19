//
//  SecoundViewController.swift
//  original
//
//  Created by 李優佳 on 2019/11/13.
//  Copyright © 2019 李優佳. All rights reserved.
//

import UIKit

class SecoundViewController: UIViewController{
    
    @IBOutlet var TextView: UITextView!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var imageview: UIImageView!
    
    var name: String!
    
    @IBAction func plus() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if name != nil {
            imageview.image = UIImage(named: name!)!
            print(name!)
        }
        
        func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsquentVC: UIViewController) {
        
        

    }
    
        func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
        func camera() {
        
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
