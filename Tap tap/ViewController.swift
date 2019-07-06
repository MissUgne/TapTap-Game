//
//  ViewController.swift
//  Tap tap
//
//  Created by Ugne Gliaudelyte on 4/10/19.
//  Copyright © 2019 Ugne Gliaudelyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var currentTaps = 0
    var highscore = 0 
    var timer2: Timer?
    var timeLeft = 30
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playBttn: UIButton!
    @IBOutlet weak var restartBttn: UIButton!
    @IBOutlet weak var highScoreBttn: UIButton!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var sunBttn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    private enum Keys {
        static let highscore = "Highscore"
    }
    
    func updateTapsLabel(){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.value(forKey: Keys.highscore) != nil) {
            highscore = defaults.value(forKey: Keys.highscore) as? Int ?? 1000
            highscoreLabel.text = "Highscore: \(highscore)"
            
        }
        
    }
    
    @IBAction func restartGameBttnPressed(){
        restartGame()
    }
    
    @IBAction func sunButtonPressed(sender: UIButton!){
        currentTaps = currentTaps + 1
        updateTapsLabel()
        
        if (currentTaps > highscore) {
            highscore = currentTaps
            highscoreLabel.text = "Highscore: \(highscore)"
            
            defaults.set(highscore, forKey: Keys.highscore)
        }
    }
    
    func startTimer(){
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @IBAction func playButtonPressed(sender: UIButton!){
            startTimer()
        
            logoImg.isHidden = true
            playBttn.isHidden = true
            restartBttn.isHidden = false
            highScoreBttn.isHidden = true
            highscoreLabel.isHidden = true
            
            timerLabel.isHidden = false
            sunBttn.isHidden = false
            tapsLabel.isHidden = false
            
            currentTaps = 0
            updateTapsLabel()
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft) s"
        
        if timeLeft <= 0 {
            timer2?.invalidate()
            timer2 = nil
            sunBttn.isHidden = true
            tapsLabel.text = "Your score is \(currentTaps)!"
            timerLabel.isHidden = true
        }
    }

    func reset(){
        timeLeft = 30
    }
    
    func restartGame() {
        
        logoImg.isHidden = false
        playBttn.isHidden = false
        highscoreLabel.isHidden = false
        
        highScoreBttn.isHidden = true
        restartBttn.isHidden = true
        timerLabel.isHidden = true
        sunBttn.isHidden = true
        tapsLabel.isHidden = true
        
        timer2?.invalidate()
        reset()
        
    }
    
    func updateHighscore() {
        defaults.set(highscore, forKey: Keys.highscore)
    }
}

