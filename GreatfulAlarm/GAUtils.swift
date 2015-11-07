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
}