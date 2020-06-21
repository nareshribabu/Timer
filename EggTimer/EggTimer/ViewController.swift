//
//  ViewController.swift
//  EggTimer
//  Created by Nareshri Babu on 18/04/2020.
//  Concept by London App Brewery
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //player for the alarm sound
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //hardnesses
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    //total time
    var totalTime = 0
    
    //will go up
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        //file constant
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        //putting the url into the player: kind of like putting a CD in a CD player
        player = try! AVAudioPlayer(contentsOf: url!)
        //we are playing the CD
        player.play()
                
    }

}
