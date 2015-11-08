//
//  ChooseDayController.swift
//  Greatful Alarm
//
//  Created by 谷村佑太 on 2015/11/07.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit

protocol ChooseDayTableView: class {
    func chooseDay(chooseDay:ChooseDayTableViewController, choosendatesIndexes indexes:[Int])
}

class ChooseDayTableViewController : UITableViewController {
    
    weak var delegate : ChooseDayTableView?
    
    class func instantiate() -> ChooseDayTableViewController {
        let storyBoard = UIStoryboard(name: "ChooseDayTableView", bundle: NSBundle.mainBundle())
        let vc = storyBoard.instantiateInitialViewController() as! ChooseDayTableViewController
        return vc
    }
    
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
    
    override func viewWillDisappear(animated: Bool) {
        if self.navigationController?.viewControllers.indexOf(self) != nil {
            return
        }
        guard let selectedRows = self.tableView.indexPathsForSelectedRows else{ return }
        self.delegate?.chooseDay(self, choosendatesIndexes: selectedRows.map({$0.row}))
    }
    
    
    //TODO: ここらへんも全般的にtagとか使って相当横着してるのでカスタムセルいつか作ろう
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("chooseDayCell", forIndexPath: indexPath) as UITableViewCell
        let titleLabel = cell.viewWithTag(1) as? UILabel
        titleLabel?.text = GAUtils.dateFormatter.weekdaySymbols[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let checkedImageView = cell?.viewWithTag(2)
        checkedImageView?.hidden = false
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let checkedImageView = cell?.viewWithTag(2)
        checkedImageView?.hidden = true
    }
    
}