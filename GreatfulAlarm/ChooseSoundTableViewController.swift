//
//  ChooseSoundTableView.swift
//  GreatfulAlarm
//
//  Created by 谷村佑太 on 2015/11/08.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit
import AVFoundation

protocol ChooseSoundTableViewDelegate: class {
    func chooseSound(chooseSound:ChooseSoundTableViewController, choosenSoundFile soundFile : SoundFile)
}

class ChooseSoundTableViewController : UITableViewController {
    
    class func instantiate() -> ChooseSoundTableViewController {
        let storyBoard = UIStoryboard(name: "ChooseSoundTableView", bundle: NSBundle.mainBundle())
        let vc = storyBoard.instantiateInitialViewController() as! ChooseSoundTableViewController
        return vc
    }

    
    weak var delegate : ChooseSoundTableViewDelegate?
    
    //だいぶ雑だけど、一旦ここに配列で格納。サーバーとか作るべきなんだけど今回はクライアントで完結させたいので。
    private let soundFilePathes : [[SoundFile]] = [
        [
            SoundFile(name: "Stay Hungry", path: GAUtils.sharedUtils.makeFilePathFromString("stay_hungry")),
            SoundFile(name: "Follow Your Heart", path: GAUtils.sharedUtils.makeFilePathFromString("follow_your_heart")),
            SoundFile(name: "Your Time Is Limited", path: GAUtils.sharedUtils.makeFilePathFromString("your_time_is_limited"))
        ],
        [
            SoundFile(name: "What Will You Be?", path: GAUtils.sharedUtils.makeFilePathFromString("what_will_u_b")),
            SoundFile(name: "In The Death Moment", path:GAUtils.sharedUtils.makeFilePathFromString("in_the_death_moment"))
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SoundCell", forIndexPath: indexPath) as! SoundCell
        cell.soundFile = self.soundFilePathes[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return
        section == 0 ? "Steeve Jobs Speech" : "Jeff Bezos Speech"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 2
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.chooseSound(self, choosenSoundFile: self.soundFilePathes[indexPath.section][indexPath.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
}