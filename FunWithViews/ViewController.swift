//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLeft: UIView!
    
    @IBOutlet weak var middleLeft: UIView!
    
    @IBOutlet weak var bottomLeft: UIView!
    
    @IBOutlet weak var middle: UIView!
    
    @IBOutlet weak var topRight: UIView!
    
    @IBOutlet weak var middleRight: UIView!
    
    @IBOutlet weak var bottomRight: UIView!
    
    @IBOutlet weak var score0: UILabel!
    
    @IBOutlet weak var score1: UILabel!
    
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var score3: UILabel!
    
    @IBOutlet weak var score4: UILabel!
    
    @IBOutlet weak var score5: UILabel!
    
    var rollOfDice = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideViews()
        
        for i in 0..<6 {
            scoreLabelForIndex(i).hidden = true
            
        }
//        for index in 1...5 {
//            print("\(index) times 5 is \(index * 5)")
//        }
        // 1 times 5 is 5
        // 2 times 5 is 10
        // 3 times 5 is 15
        // 4 times 5 is 20
        // 5 times 5 is 25
        
    }
    
    func hideViews() {
        
        topLeft.hidden = true
        middleLeft.hidden = true
        bottomLeft.hidden = true
        
        middle.hidden = true
        
        topRight.hidden = true
        middleRight.hidden = true
        bottomRight.hidden = true
    }
    
    func scoreLabelForIndex(i: Int) -> UILabel {
        switch i {
        case 0: return score0
        case 1: return score1
        case 2: return score2
        case 3: return score3
        case 4: return score4
        case 5: return score5
        default: assert(false, "Invalid: \(i)")
        }
    }
    
    func viewForIndex(i: Int) -> UIView {
        switch i {
        case 0: return topLeft
        case 1: return middleLeft
        case 2: return bottomLeft
        case 3: return middle
        case 4: return topRight
        case 5: return middleRight
        case 6: return bottomRight
        default: assert(false, "Invalid: \(i)")
        }
    }

    
    func updateScore(score: Int) {
        let scoreLabel = scoreLabelForIndex(rollOfDice % 6)
        scoreLabel.text = "\(score)"
        scoreLabel.hidden = false
    }
    
    func viewsForScore(score: Int) -> [UIView] {
        switch score {
        case 1: return [middle]
        case 2: return [bottomLeft, topRight]
        case 3: return [bottomLeft, middle, topRight]
        case 4: return [topLeft, topRight, bottomLeft, bottomRight]
        case 5: return [topLeft, topRight, middle, bottomLeft, bottomRight]
        case 6: return [topLeft, topRight, middleLeft, middleRight, bottomLeft, bottomRight]
        default: assert(false, "Invalid score: \(score)")
        }
    }
    
    func rearrangeViews(score: Int) {
        
        hideViews()
        
        for view in viewsForScore(score) {
            view.hidden = false
        }
    }
    
    
    
    
    @IBAction func diceRoll(sender: AnyObject) {
        
        let myRoll = randomDiceRoll()
        updateScore(myRoll)
        rearrangeViews(myRoll)
        rollOfDice += 1
    
    }
    
    @IBAction func restartTapped(sender: AnyObject) {
        
        hideViews()
        
        for i in 0..<6 {
            scoreLabelForIndex(i).hidden = true
            
        }
    }
    
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
}
