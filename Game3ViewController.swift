//
//  Game3ViewController.swift
//  Guerra The Game
//
//  Created by Diogo Alves on 31/12/2021.
//

import UIKit

class Game3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
        @IBOutlet weak var CardOne: UIImageView!
        @IBOutlet weak var CardTwo: UIImageView!
        @IBOutlet weak var CardThree: UIImageView!
        @IBOutlet weak var ScoreOne: UILabel!
        @IBOutlet weak var ScoreTwo: UILabel!
        @IBOutlet weak var ScoreThree: UILabel!
        @IBOutlet weak var Player1Wins: UIImageView!
        @IBOutlet weak var Player2Wins: UIImageView!
        @IBOutlet weak var GuerraButton: UIButton!
        @IBOutlet weak var Draw: UIImageView!
        @IBOutlet weak var Player3Wins: UIImageView!
        @IBOutlet weak var P1P2Wins: UIImageView!
        @IBOutlet weak var P1P3Wins: UIImageView!
        @IBOutlet weak var P2P3Wins: UIImageView!
    
        var alreadyLeft: [String] = []
        var score1: Int = 0
        var score2: Int = 0
        var score3: Int = 0
        var playsCount: Int = 0
        
        

        @IBAction func gameButton(_ sender: UIButton) {
            
            var cardNumber1: Int = 0
            var cardSymbol1: Int = 0
            var cardNumber2: Int = 0
            var cardSymbol2: Int = 0
            var cardNumber3: Int = 0
            var cardSymbol3: Int = 0
            var cardName: String = ""
            var randomPlayNumbers: [Int] = []
            playsCount = playsCount+1
            
            repeat {
                cardNumber1 = Int.random(in: 2...14)
                cardSymbol1 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber1)_\(cardSymbol1).png"
            } while alreadyLeft.contains(cardName)
            
            CardOne.image = UIImage(named: cardName)
            randomPlayNumbers.append(cardNumber1)
            alreadyLeft.append(cardName)
            
            repeat {
                cardNumber2 = Int.random(in: 2...14)
                cardSymbol2 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber2)_\(cardSymbol2).png"
            } while alreadyLeft.contains(cardName)
            
            alreadyLeft.append(cardName)
            randomPlayNumbers.append(cardNumber2)
            CardTwo.image = UIImage(named: cardName)
            
            repeat {
                cardNumber3 = Int.random(in: 2...14)
                cardSymbol3 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber3)_\(cardSymbol3).png"
            } while alreadyLeft.contains(cardName)
            
            alreadyLeft.append(cardName)
            randomPlayNumbers.append(cardNumber3)
            CardThree.image = UIImage(named: cardName)
            
            let maxNumber = randomPlayNumbers.max()
            
            if (cardNumber1 == maxNumber && cardNumber2 == maxNumber && cardNumber3 == maxNumber) {
                score1 = score1+1
                score2 = score2+1
                score3 = score3+1
            }
            else if (cardNumber1 == maxNumber && cardNumber2 == maxNumber){
                score1 = score1+1
                score2 = score2+1
            }
            else if (cardNumber1 == maxNumber && cardNumber3 == maxNumber){
                score1 = score1+1
                score3 = score3+1
            }
            else if (cardNumber2 == maxNumber && cardNumber3 == maxNumber){
                score2 = score2+1
                score3 = score3+1
            }
            else if (cardNumber1 == maxNumber){
                score1 = score1+1
            }
            else if (cardNumber2 == maxNumber){
                score2 = score2+1
            }
            else if (cardNumber3 == maxNumber){
                score3 = score3+1
            }
        
            ScoreOne.text = String(score1)
            ScoreTwo.text = String(score2)
            ScoreThree.text = String(score3)
            
            if playsCount == 17{
                GuerraButton.alpha = 0
                if (score1 == score2 && score2 == score3) {
                    Draw.alpha = 1
                }
                else if (score1 == score2 && score2 > score3){
                    P1P2Wins.alpha = 1
                }
                else if (score1 == score3 && score3 > score2){
                    P1P3Wins.alpha = 1
                }
                else if (score2 == score3 && score2 > score1){
                    P2P3Wins.alpha = 1
                }
                else if (score1 > score2 && score1 > score3){
                    Player1Wins.alpha = 1
                }
                else if (score2 > score1 && score2 > score3){
                    Player2Wins.alpha = 1
                }
                else if (score3 > score1 && score3 > score2){
                    Player3Wins.alpha = 1
                }

            }
        }
        
        @IBAction func NewGameButton(_ sender: UIButton) {
            CardOne.image = #imageLiteral(resourceName: "ParteTrasCarta1")
            CardTwo.image = #imageLiteral(resourceName: "ParteTrasCarta2")
            CardThree.image = #imageLiteral(resourceName: "ParteTrasCarta2")
            Player1Wins.alpha = 0
            Player2Wins.alpha = 0
            Player3Wins.alpha = 0
            P1P3Wins.alpha = 0
            P1P2Wins.alpha = 0
            P2P3Wins.alpha = 0
            Draw.alpha = 0
            GuerraButton.alpha = 1
            ScoreOne.text = "0"
            ScoreTwo.text = "0"
            ScoreThree.text = "0"
            alreadyLeft = []
            score1 = 0
            score2 = 0
            score3 = 0
            playsCount = 0
        }
    
}
