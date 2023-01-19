//
//  ViewController.swift
//  tictactoe Game
//
//  Created by VIkram Kunwar on 03/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        Restart.isHidden = true
        
        Restart.layer.cornerRadius = 5
        Restart.layer.masksToBounds = true
    }
    
    var activePlayer = 1 // X is Active
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Restart: UIButton!
    
    
    
    //Button action has been added 
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "tictactoeX"), for: UIControl.State())
                activePlayer = 2 // O is Active
            } else {
                sender.setImage(UIImage(named: "tictactoeO"), for: UIControl.State())
                activePlayer = 1 // X is Active
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    label.text = "X is the winner!🥳"
                    disableButtons()
                } else {
                    label.text = "O is the winner!🥳"
                    disableButtons()
                }
                
                Restart.isHidden = false
                label.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            label.text = "Match is DRAW 😅"
            disableButtons()
            label.isHidden = false
            Restart.isHidden = false
        }
        
    }
    
    //To restart the Game
    @IBAction func Restart(_ sender: Any) {
        enableButtons()
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        label.isHidden = true
        Restart.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(named: "tictactoeblank"), for: UIControl.State())
        }
        
    }
    
    func disableButtons() {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = false
        }
    }
    
    func enableButtons() {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = true
        }
    }
    
}

