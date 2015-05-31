//
//  ViewController.swift
//  TicTacToeSimplegame
//
//  Created by Mac on 14/01/15.
//  Copyright (c) 2015 CZ. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var counterNoughts = 1
    var counterCrosses = 1
    
    @IBOutlet weak var user1Label: UILabel!
    
    @IBOutlet weak var user2Label: UILabel!
    
    var goNumber = 1
    
    // 0 = empty, 1 = nought, 2 = cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winner = 0
    
    var winComb = [[0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[2,4,6],[0,4,8]]
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playAgainoutlet: UIButton!
    
    // to play again
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        goNumber = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winner = 0
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        label.alpha = 0
        playAgainoutlet.alpha = 0
        
        // to empty the current background images on all the buttons
        
        var button : UIButton
        
        for var i = 0; i<9; i++ {
            
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var image = UIImage()
        
        if (gameState[sender.tag] == 0 && winner == 0) {
            
            if (goNumber%2 == 0) {
                
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 1
                
                
            } else {
                
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
                
            }
            
            // to check the conidition
            
            for  combination in winComb {
                
                if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0
                    
                {
                    winner = gameState[combination[0]]}}
            
            
            if (winner != 0){
                if(winner == 1){
                    
                    label.text = "Noughts has won"
                    user2Label.text = "\(counterNoughts)"
                    ++counterNoughts
                    
                }
                else {
                    
                    label.text = "Crosses has won"
                    user1Label.text = "\(counterCrosses)"
                    ++counterCrosses
                    
                }
                // to animate the label
                UIView.animateWithDuration(0.4, animations: {
                    
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    self.label.alpha = 1
                    self.playAgainoutlet.alpha = 1
                    
                })
                
            } else if (goNumber  == 9) {
                
                label.text = "Try again"
                label.alpha = 1
                playAgainoutlet.alpha = 1
                
            }
            
            goNumber++
            
            sender.setImage(image, forState: .Normal)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //animate the label
    
    override func viewDidAppear(animated: Bool) {
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        label.alpha = 0
        playAgainoutlet.alpha = 0
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

