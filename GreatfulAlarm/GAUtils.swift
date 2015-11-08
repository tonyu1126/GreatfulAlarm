//
//  GAUtils.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class GAUtils {
    static let dateFormatter = NSDateFormatter()
    static let sharedUtils = GAUtils()

    func changeDateToString(date : NSDate) -> String {
        let dateFormatter = GAUtils.dateFormatter
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "HH:mm"
        let stringDate = dateFormatter.stringFromDate(date)
        return stringDate
    }
    
    func makeFilePathFromString(fileName:String) -> NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3")!)
    }
    
    func dayOftheWeekFromIndex(indexes:[Int])->String{
        let dateformatter  = GAUtils.dateFormatter
        dateformatter.locale = NSLocale.currentLocale()
        var weekdaysString = ""
        for index in indexes.sort(<) {
            let dayOfWeek = dateformatter.weekdaySymbols[index]
            weekdaysString += "\(dayOfWeek),"
        }
        weekdaysString = weekdaysString.characters.count != 0 ? weekdaysString : "None"
        return weekdaysString
    }
}