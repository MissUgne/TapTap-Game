//
//  ViewController.swift
//  Tap tap
//
//  Created by Ugne Gliaudelyte on 4/10/19.
//  Copyright © 2019 Ugne Gliaudelyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBttn: UIButton!
    
    @IBOutlet weak var sunBttn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    //Actions
    func updateTapsLabel(){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    
    @IBAction func sunButtonPressed(sender: UIButton!){
        currentTaps = currentTaps + 1
        updateTapsLabel()
        
        if isGameOver(){
            restartGame()
        }
        
    }
    
    @IBAction func playButtonPressed(sender: UIButton!){
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImg.isHidden = true
            howManyTapsTxt.isHidden = true
            playBttn.isHidden = true
            
            sunBttn.isHidden = false
            tapsLabel.isHidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }else{
            return false
        }
    }

    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.isHidden = false
        howManyTapsTxt.isHidden = false
        playBttn.isHidden = false
        
        sunBttn.isHidden = true
        tapsLabel.isHidden = true
    }
}

