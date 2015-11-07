//
//  ViewController.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class AlarmListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "AlarmList"
        let date: NSDate = NSDate()
        let cal: NSCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let comp: NSDateComponents = cal.components(
            [NSCalendarUnit.Weekday],
            fromDate: date
        )
        let weekday: Int = comp.weekday
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja")
        print(weekday)
        print(formatter.weekdaySymbols[weekday - 6])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmModelManager.sharedManger.alarmModels.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alarmListCell", forIndexPath: indexPath) as! AlarmListCell
        cell.m = AlarmModelManager.sharedManger.alarmModels[indexPath.row]
        return cell
    }
    

}

