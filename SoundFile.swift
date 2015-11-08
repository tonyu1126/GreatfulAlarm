//
//  SoundFile.swift
//  GreatfulAlarm
//
//  Created by 谷村佑太 on 2015/11/08.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import Foundation
class SoundFile {
    let name : String
    let path : NSURL
    
    init(name:String, path:NSURL){
        self.name = name
        self.path = path
    }
}