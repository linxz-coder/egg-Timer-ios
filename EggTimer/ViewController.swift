//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    @IBOutlet weak var doneLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        timer.invalidate() //取消timer每次点击都会触发，现在仅触发1次
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        doneLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
            
        } else {
            timer.invalidate() // 停止定时器
            doneLabel.text = "Done." // 更新标签文字
            playSound()
        }
    }
    
//    播放声音
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    

}
