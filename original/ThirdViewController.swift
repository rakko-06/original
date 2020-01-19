//
//  ThirdViewController.swift
//  original
//
//  Created by 李優佳 on 2019/11/24.
//  Copyright © 2019 李優佳. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func plus() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face4.png"
        self.present(nextVC, animated: true, completion: nil)
        //self.present(1,animated: true, completion: nil)
    }
    
    @IBAction func button2() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face3.png"
        self.present(nextVC, animated: true, completion: nil)
        //self.present(2,animated: true, completion: nil)
    }
    
    @IBAction func button3() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face1.png"
        self.present(nextVC, animated: true, completion: nil)
        //self.present(3,animated: true, completion: nil)
    }
    
    @IBAction func button4() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face5.png"
        self.present(nextVC, animated: true, completion: nil)
        //self.present(4,animated: true, completion: nil)
    }
    
    @IBAction func button5() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face2.png"
        self.present(nextVC, animated: true, completion: nil)
        //self.present(5,animated: true, completion: nil)
    }
    
    @IBAction func butto6() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "presentView")as! SecoundViewController
        nextVC.name = "face6.png"
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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
