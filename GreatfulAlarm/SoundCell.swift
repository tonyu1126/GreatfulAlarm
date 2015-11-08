//
//  SoundCell.swift
//  GreatfulAlarm
//
//  Created by 谷村佑太 on 2015/11/08.
//  Copyright © 2015年 Yuta Tanimura. All rights reserved.
//

import UIKit
import AVFoundation

class SoundCell : UITableViewCell, AVAudioPlayerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var soundControllButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var audioPlayer : AVAudioPlayer?
    var soundFile : SoundFile? {
        didSet{
            self.audioPlayer = try? AVAudioPlayer(contentsOfURL: soundFile!.path)
            self.audioPlayer?.prepareToPlay()
            self.audioPlayer!.delegate = self
            self.titleLabel.text = soundFile!.name
        }
    }
    
    @IBAction func soundControllButtonDidTouchDown(_: UIButton) {
        //Bond使って綺麗にしたい感ある
        if self.soundControllButton.selected {
            self.audioPlayer?.stop()
            self.soundControllButton.selected = false
        } else {
            self.audioPlayer?.play()
            self.soundControllButton.selected = true
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if flag && self.soundControllButton.selected {
            self.soundControllButton.selected = false
        }
    }
    
}
