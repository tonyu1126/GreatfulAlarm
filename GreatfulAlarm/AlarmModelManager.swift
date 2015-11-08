//
//  AlarmModelManager.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class AlarmModelManager {
    static let sharedManager = AlarmModelManager()
    var alarmModels : [Alarm] = []
    
    func save(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(self.alarmModels, forKey: "AlarmSettings")
        userDefaults.synchronize()
    }
    
    func insert(alarm:Alarm){
        self.alarmModels.append(alarm)
    }
    
    func delete(index : Int) {
        self.alarmModels.removeAtIndex(index)
    }
    
    func setAlarmNotifications() {
        UIApplication.sharedApplication().cancelAllLocalNotifications();
        let availableAlarm = self.alarmModels.filter({$0.isOn == true})
        for alarm in availableAlarm {
            let notification = UILocalNotification()
            notification.fireDate = alarm.setTime
            notification.repeatInterval = NSCalendarUnit.Weekday
            notification.timeZone = NSTimeZone.localTimeZone()
            notification.alertBody = "WakeUp"
            notification.alertAction = "OK"
            notification.soundName = "\(alarm.soundFile?.path.pathComponents?.last)"
            UIApplication.sharedApplication().scheduleLocalNotification(notification);
        }
    }
    
    
}