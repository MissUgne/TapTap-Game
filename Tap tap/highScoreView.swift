//
//  highScoreView.swift
//  Tap tap
//
//  Created by Ugne Gliaudelyte on 6/29/19.
//  Copyright © 2019 Ugne Gliaudelyte. All rights reserved.
//

/**import Foundation
import UIKit

class highScoreView: UIViewController {
    
@IBOutlet weak var highScoreLabel: UILabel!

 var highscore = ViewController().highscore
 
 func get highscoreStorage() -> UserDefaults {
    return UserDefaults.standard
 }
    
 private enum Keys {
 static let highscore = "Highscore"
 
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
 
 func updateHighscoreLabel() {
    highscoreLabel.text = "Highscore: \(highscore)"
 }
    
    func setHighScore() {
        defaults.set(highscore, forKey: Keys.highscore)
        
    }
    
    func getHighscore () {
    let defaults = highscoreStorage()
 if (defaults.value(forKey: Keys.highscore) != nil) {
 highscore = defaults.value(forKey: Keys.highscore) as? Int ?? 1000
 updateHighscoreLabel()
            
        }
    }
}**/



            

