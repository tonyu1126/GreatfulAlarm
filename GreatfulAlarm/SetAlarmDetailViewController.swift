//
//  setAlarmDetailViewController.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class SetAlarmDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    let titleLabelStrings : [String] = ["Day Of Week","Sound", "Snooze"]
    var alarm : Alarm? {
        didSet{
            self.tableView.reloadData()
        }
    }
    class func instantiate()->SetAlarmDetailViewController {
        let storyBoard = UIStoryboard(name: "SetAlarmDetailView", bundle: NSBundle.mainBundle())
        let vc : SetAlarmDetailViewController = storyBoard.instantiateInitialViewController() as! SetAlarmDetailViewController
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SetAlarmDetail"
        let rightbtn = UIBarButtonItem(title: "save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveAlarm:")
        self.navigationItem.rightBarButtonItem = rightbtn
        let leftbtn = UIBarButtonItem(title: "cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "closeView:")
        self.navigationItem.leftBarButtonItem = leftbtn
    }
    
    func saveAlarm(_:NSNotification) {
        
    }
    
    func closeView(_:NSNotification) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as UITableViewCell
            let titleLabel = cell.viewWithTag(1) as? UILabel
            titleLabel?.text = self.titleLabelStrings[indexPath.row]
            let detailLabel = cell.viewWithTag(2) as? UILabel
            if indexPath.row == 0 {
                detailLabel?.text = alarm?.repeatedday != nil ?  GAUtils.sharedUtils.dayOftheWeekFromIndex(alarm!.repeatedday!) : "None"
            } else if indexPath.row == 1 {
                detailLabel?.text = self.alarm?.soundType ?? "None"
            }
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("deleteCell", forIndexPath: indexPath)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        } else {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
}