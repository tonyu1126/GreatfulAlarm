//
//  setAlarmDetailViewController.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class SetAlarmDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, ChooseDayTableViewDelegate, ChooseSoundTableViewDelegate {
    
    let chooseSoundVC = ChooseSoundTableViewController.instantiate()
    let chooseDayVC   = ChooseDayTableViewController.instantiate()
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    let titleLabelStrings : [String] = ["Day Of Week","Sound", "Snooze"]
    var alarm : Alarm = Alarm.init()
    class func instantiate()->SetAlarmDetailViewController {
        let storyBoard = UIStoryboard(name: "SetAlarmDetailView", bundle: NSBundle.mainBundle())
        let vc : SetAlarmDetailViewController = storyBoard.instantiateInitialViewController() as! SetAlarmDetailViewController
        return vc
    }
    
    func chooseDay(chooseDay: ChooseDayTableViewController, choosendatesIndexes indexes: [Int]) {
        self.alarm.repeatedday = indexes
        self.tableView.reloadData()
    }
    
    func chooseSound(chooseSound: ChooseSoundTableViewController, choosenSoundFile soundFile: SoundFile) {
        self.alarm.soundFile = soundFile
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.locale = NSLocale.currentLocale()
        self.chooseSoundVC.delegate = self
        self.chooseDayVC.delegate = self
        let rightbtn = UIBarButtonItem(title: "save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveAlarm:")
        self.navigationItem.rightBarButtonItem = rightbtn
        let leftbtn = UIBarButtonItem(title: "cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "closeView:")
        self.navigationItem.leftBarButtonItem = leftbtn
    }
    
    func saveAlarm(_:NSNotification) {
        self.alarm.setTime = self.datePicker.date
        self.alarm.isOn = true
        if self.alarm.repeatedday == nil || self.alarm.soundFile == nil {
            return
        }
        AlarmModelManager.sharedManager.insert(self.alarm)
        NSNotificationCenter.defaultCenter().postNotificationName("ReloadTopViewTable", object: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func closeView(_:NSNotification) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        //TODO: tagとか使って相当横着してるのでカスタムセルいつか作ろう
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as UITableViewCell
            let titleLabel = cell.viewWithTag(1) as? UILabel
            titleLabel?.text = self.titleLabelStrings[indexPath.row]
            let detailLabel = cell.viewWithTag(2) as? UILabel
            if indexPath.row == 0 {
                guard let days = self.alarm.repeatedday else {
                    detailLabel?.text = "None"
                    return cell
                }
                detailLabel?.text = GAUtils.sharedUtils.dayOftheWeekFromIndex(days)
            } else if indexPath.row == 1 {
                detailLabel?.text = self.alarm.soundFile?.name ?? "None"
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            let vc = indexPath.row == 0 ?  chooseDayVC : chooseSoundVC
            self.navigationController?.pushViewController(vc, animated: true)
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