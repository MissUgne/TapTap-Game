//
//  ViewController.swift
//  TapTap Game
//
//  Created by MissUgnne on 4/10/19.
//  Copyright © 2019 MissUgnne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var currentTaps = 0
    var highscore = 0
    var timer: Timer?
    var timeLeft = 30
    
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playBttn: UIButton!
    @IBOutlet weak var restartBttn: UIButton!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var highscoreButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sunBttn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    private enum Keys {
        static let highscore = "Highscore"
    }
    
    func updateTapsLabel(){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func updateHighscoreLabel() {
        highscoreLabel.text = "1st highscore: \(highscore)"
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHighscore()
    }
    
    @IBAction func restartGameBttnPressed(){
        restartGame()
    }
    
    @IBAction func highscoreButtonPressed() {
        logoImg.isHidden = true
        playBttn.isHidden = true
        highscoreLabel.isHidden = false
        backButton.isHidden = false
        highscoreButton.isHidden = true
        restartBttn.isHidden = true
        timerLabel.isHidden = true
        sunBttn.isHidden = true
        tapsLabel.isHidden = true
    }
    
    @IBAction func backButtonPressed() {
        logoImg.isHidden = false
        playBttn.isHidden = false
        highscoreLabel.isHidden = true
        backButton.isHidden = true
        highscoreButton.isHidden = false
        restartBttn.isHidden = true
        timerLabel.isHidden = true
        sunBttn.isHidden = true
        tapsLabel.isHidden = true
    }
    
    @IBAction func sunButtonPressed(sender: UIButton!) {
        currentTaps = currentTaps + 1
        updateTapsLabel()
        
        if (currentTaps > highscore) {
            highscore = currentTaps
            print("This is highscore: \(highscore)")
            
            updateHighscoreLabel()
            setHighscore()
            print("Highscore: \(highscore)")
        }
        
        }
       
        

    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @IBAction func playButtonPressed(sender: UIButton!){
            startTimer()
        
            logoImg.isHidden = true
            playBttn.isHidden = true
            highscoreLabel.isHidden = true
            highscoreButton.isHidden = true
            backButton.isHidden = true
            restartBttn.isHidden = false
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
            timer?.invalidate()
            timer = nil
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
        highscoreLabel.isHidden = true
        highscoreButton.isHidden = false
        backButton.isHidden = true
        restartBttn.isHidden = true
        timerLabel.isHidden = true
        sunBttn.isHidden = true
        tapsLabel.isHidden = true
        
        timer?.invalidate()
        reset()
        
    }
    
    func setHighscore() {
        defaults.set(highscore, forKey: Keys.highscore)
    }
    
    func getHighscore() {
        if (defaults.value(forKey: Keys.highscore) != nil) {
            highscore = defaults.value(forKey: Keys.highscore) as? Int ?? 1000
            updateHighscoreLabel()
    }
}

}
