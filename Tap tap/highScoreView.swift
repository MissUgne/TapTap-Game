//
//  highScoreView.swift
//  Tap tap
//
//  Created by Ugne Gliaudelyte on 6/29/19.
//  Copyright © 2019 Ugne Gliaudelyte. All rights reserved.
//

import Foundation
import UIKit

class highScoreView: UIViewController {
    
@IBOutlet weak var highScoreLabel: UILabel!
    
    var score = ViewController().currentTaps
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let HighscoreDefault = UserDefaults.standard
        
        if (HighscoreDefault.value(forKey: "Highscore") != nil){
            highScore = HighscoreDefault.value(forKey: "Highscore") as! Int
            highScoreLabel.text = String(highScore)
        }
        
    }
    
    func updateHighScore() {
        if score > highScore {
            highScoreLabel.text = String(highScore)
            
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.setValue(highScore, forKey: "Highscore")
            HighscoreDefault.synchronize()
        }
    }
}
