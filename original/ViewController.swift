//
//  ViewController.swift
//  original
//
//  Created by 李優佳 on 2019/11/10.
//  Copyright © 2019 李優佳. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 25
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func judgeHoliday(_ date : Date) -> Bool {
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    func getDay(_ date: Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }
        
        else if weekday == 7 {
            return UIColor.blue
        }
        
        return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func plus() {
        
    }
    
    @IBOutlet weak var button: UIButton!
    


}

