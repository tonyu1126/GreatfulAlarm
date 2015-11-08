//
//  AlarmListTableViewCell.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class AlarmListCell : UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    var m : Alarm! {
        didSet {
            self.timeLabel.text = GAUtils.sharedUtils.changeDateToString(m.setTime!)
            self.statusLabel.text = GAUtils.sharedUtils.dayOftheWeekFromIndex(m.repeatedday!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}