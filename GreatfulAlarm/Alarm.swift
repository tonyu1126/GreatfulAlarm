//
//  AlarmListCellModel.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import Foundation

class Alarm {
    var setTime : NSDate?
    var isOn    : Bool?
    var soundType : String?
    var repeatedday : [Int]?
    
    init(AlarmData:Dictionary<String, AnyObject>){
        self.setTime = AlarmData["setTime"] as? NSDate
        self.isOn    = AlarmData["isOn"] as? Bool
        self.soundType    = AlarmData["soundType"] as? String
        self.repeatedday   = AlarmData["repeatedDay"] as? [Int]
    }
    
    init(){}
    
}