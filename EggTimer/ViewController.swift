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
    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]

    var totalTime:Float=0
    var secondsPassed:Float=0
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    var timer=Timer()
    var player: AVAudioPlayer!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed=0
       
        let hardness = sender.currentTitle!
        label.text = hardness
        totalTime = Float(eggTimes[hardness]!)
    
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    
    @objc func updateTimer(){
        if(secondsPassed < totalTime){
            secondsPassed+=1
            progressBar.progress = secondsPassed/totalTime
        }else{
            label.text="Done"
            timer.invalidate()
            playSound(soundName:"alarm_sound")
        }
        
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
