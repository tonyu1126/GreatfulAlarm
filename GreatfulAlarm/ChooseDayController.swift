//
//  ChooseDayController.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

class ChooseDayController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Choose Days of the week"
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dequeueReusableCellWithIdentifier", forIndexPath: indexPath)
        return cell
    }
    
}