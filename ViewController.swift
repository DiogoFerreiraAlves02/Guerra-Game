//
//  ViewController.swift
//  Guerra The Game
//
//  Created by Diogo Alves on 29/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CardOne: UIImageView!
        @IBOutlet weak var CardTwo: UIImageView!
        @IBOutlet weak var ScoreOne: UILabel!
        @IBOutlet weak var ScoreTwo: UILabel!
        @IBOutlet weak var Player1Wins: UIImageView!
        @IBOutlet weak var Player2Wins: UIImageView!
        @IBOutlet weak var GuerraButton: UIButton!
        @IBOutlet weak var Draw: UIImageView!
        
        var alreadyLeft: [String] = []
        var score1: Int = 0
        var score2: Int = 0
        var playsCount: Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        @IBAction func gameButton(_ sender: UIButton) {
            
            var cardNumber1: Int = 0
            var cardSymbol1: Int = 0
            var cardNumber2: Int = 0
            var cardSymbol2: Int = 0
            var cardName: String = ""
            playsCount = playsCount+1
            
            repeat {
                cardNumber1 = Int.random(in: 2...14)
                cardSymbol1 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber1)_\(cardSymbol1).png"
            } while alreadyLeft.contains(cardName)
            
            CardOne.image = UIImage(named: cardName)
            
            alreadyLeft.append(cardName)
            
            repeat {
                cardNumber2 = Int.random(in: 2...14)
                cardSymbol2 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber2)_\(cardSymbol2).png"
            } while alreadyLeft.contains(cardName)
            
            alreadyLeft.append(cardName)
            
            CardTwo.image = UIImage(named: cardName)
            
            if cardNumber1 > cardNumber2 {
                score1 = score1+1
            }
            else if cardNumber1 < cardNumber2{
                score2 = score2+1
            }
            else {
                score1 = score1+1
                score2 = score2+1
            }
            ScoreOne.text = String(score1)
            ScoreTwo.text = String(score2)
            
            if playsCount == 26{
                GuerraButton.alpha = 0
                if score1 > score2{
                    Player1Wins.alpha = 1
                }
                else if score2 > score1{
                    Player2Wins.alpha = 1
                }
                else {
                    Draw.alpha = 1
                }
            }
        }
        
        @IBAction func NewGameButton(_ sender: UIButton) {
            CardOne.image = #imageLiteral(resourceName: "ParteTrasCarta1")
            CardTwo.image = #imageLiteral(resourceName: "ParteTrasCarta2")
            Player1Wins.alpha = 0
            Player2Wins.alpha = 0
            Draw.alpha = 0
            GuerraButton.alpha = 1
            ScoreOne.text = "0"
            ScoreTwo.text = "0"
            alreadyLeft = []
            score1 = 0
            score2 = 0
            playsCount = 0
        }
}

