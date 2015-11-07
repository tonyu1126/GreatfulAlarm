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

    
    func changeDateToString(date : NSDate)->String {
        let dateFromatter = GAUtils.dateFormatter
        dateFromatter.locale = NSLocale.systemLocale()
        return dateFromatter.stringFromDate(date)
    }
    
    func dayOftheWeekFromIndex(indexes:[Int])->String{
        let dateformatter  = GAUtils.dateFormatter
        let cal: NSCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let date = NSDate(timeIntervalSince1970: 1446901369)
        let comp: NSDateComponents = cal.components(
            [NSCalendarUnit.Weekday],
            fromDate: date)
        let weekday = comp.weekday
        dateformatter.locale = NSLocale.systemLocale()
        var weekdaysString = ""
        for index in indexes {
            let dayOfWeek = dateformatter.weekdaySymbols[weekday - index]
            weekdaysString += dayOfWeek
        }
        weekdaysString = weekdaysString.characters.count == 0 ? weekdaysString : "None"
        return weekdaysString
    }
}