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
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "reloadTableView:", name: "ReloadTopViewTable", object: nil)
        nc.addObserver(self, selector: "setAlarmNotification:", name: "applicationDidEnterBackground", object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reloadTableView (_ : NSNotification) {
        self.tableView.reloadData()
    }
    
    func setAlarmNotification(_ : NSNotification) {
        AlarmModelManager.sharedManager.setAlarmNotifications()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            AlarmModelManager.sharedManager.delete(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmModelManager.sharedManager.alarmModels.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alarmListCell", forIndexPath: indexPath) as! AlarmListCell
        cell.m = AlarmModelManager.sharedManager.alarmModels[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonTapped(_: UIBarButtonItem) {
        let vc = SetAlarmDetailViewController.instantiate()
        let nav = UINavigationController(rootViewController: vc)
        self.navigationController?.presentViewController(nav, animated: true, completion: nil)
    }
    
    
}

