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
    
    func delete(indexes : Int) {
        
    }
}