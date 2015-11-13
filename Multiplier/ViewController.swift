//
//  ViewController.swift
//  Multiplier
//
//  Created by shawn murray on 11/13/15.
//  Copyright © 2015 shawn murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var userInput = 0
    var runningSum = 0
    let MAXLIMIT = 100
    

    // Outlets
    @IBOutlet var multipleLogo: UIImageView!
    @IBOutlet var pressToAdd: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var playButton: UIButton!
    
    
    @IBAction func playButton(sender: UIButton) {
        
        if textField.text != nil && textField.text != "" {
            
            multipleLogo.hidden = true
            playButton.hidden = true
            textField.hidden = true
            addButton.hidden = false
            pressToAdd.hidden = false
            
            resetLbl()
            userInput = Int(textField.text!)!
            runningSum = 0
            
        }
        
    } // End of playButton
    
    @IBAction func addButton(sender: UIButton) {
        
        let newSum = runningSum + userInput
        updateLbl(runningSum, mul: userInput, newSum: newSum)
        runningSum += userInput
        
        if isGameOver() {
            restartGame()
        }
        
    }
    
    // function to restart game
    func restartGame() {
        
        userInput = 0
        textField.text = ""
        
        multipleLogo.hidden = false
        playButton.hidden = false
        textField.hidden = false
        addButton.hidden = true
        pressToAdd.hidden = true
    }
    
    // function to determine is game is over
    func isGameOver() -> Bool {
        
        if runningSum >= MAXLIMIT {
            return true
        } else {
            return false
        }
        
    } // End of isGameOver
    
    func resetLbl() {
        pressToAdd.text = "Press Add to add!"
    }

    func updateLbl(oldSum: Int, mul: Int, newSum: Int) {
        pressToAdd.text = "\(oldSum) + \(mul) = \(newSum)"
    }

    

}

