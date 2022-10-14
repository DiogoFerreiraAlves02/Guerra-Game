//
//  Deck2PlayersGameViewController.swift
//  Guerra The Game
//
//  Created by Diogo Alves on 03/01/2022.
//

import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Deck2PlayersGameViewController: UIViewController {
        let numberOfCardsPerPlayer = 5
        @IBOutlet weak var CardOne: UIImageView!
        @IBOutlet weak var CardTwo: UIImageView!
        @IBOutlet weak var ScoreOne: UILabel!
        @IBOutlet weak var ScoreTwo: UILabel!
        @IBOutlet weak var Player1Wins: UIImageView!
        @IBOutlet weak var Player2Wins: UIImageView!
        @IBOutlet weak var GuerraButton: UIButton!
        @IBOutlet weak var Draw: UIImageView!
        @IBOutlet weak var Deck1Cards: UILabel!
        @IBOutlet weak var Deck2Cards: UILabel!
    
        var deck1: [String] = []
        var deck2: [String] = []
        var score1: Int = 0
        var score2: Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            randomDeck()
        }

        @IBAction func gameButton(_ sender: UIButton) {
            Deck1Cards.alpha = 1
            Deck2Cards.alpha = 1
            let actualCard1 : String = deck1[0]
            let actualCard2 : String = deck2[0]
            var cardNumber1 : Int = 0
            var cardNumber2 : Int = 0
            
            if String(actualCard1[5]) == "1"{
                cardNumber1 = Int( "\(String(actualCard1[5]))\(String(actualCard1[6]))")!
            }
            else {
                cardNumber1 = Int(String(actualCard1[5]))!
            }
            
            if String(actualCard2[5]) == "1"{
                cardNumber2 = Int( "\(String(actualCard2[5]))\(String(actualCard2[6]))")!
            }
            else {
                cardNumber2 = Int(String(actualCard2[5]))!
            }
            
            CardOne.image = UIImage(named: actualCard1)
            CardTwo.image = UIImage(named: actualCard2)
            
            deck1.removeFirst()
            deck2.removeFirst()
            
            if cardNumber1 > cardNumber2 {
                score1 = score1+1
                if Int.random(in: 1...2) == 1{
                    deck2.append(actualCard1)
                    deck2.append(actualCard2)
                } else{
                    deck2.append(actualCard2)
                    deck2.append(actualCard1)
                }
            }
            else if cardNumber1 < cardNumber2 {
                score2 = score2+1
                if Int.random(in: 1...2) == 1{
                    deck1.append(actualCard1)
                    deck1.append(actualCard2)
                } else{
                    deck1.append(actualCard2)
                    deck1.append(actualCard1)
                }
            }
            else {
                score1 = score1+1
                score2 = score2+1
                if Int.random(in: 1...2) == 1{
                    deck1.append(actualCard2)
                    deck2.append(actualCard1)
                } else{
                    deck1.append(actualCard1)
                    deck2.append(actualCard2)
                }
            }
            
            ScoreOne.text = String(score1)
            ScoreTwo.text = String(score2)
            Deck1Cards.text = String(deck1.count)
            Deck2Cards.text = String(deck2.count)
        
        if deck1.count == 0{
            GuerraButton.alpha = 0
            Player1Wins.alpha = 1
        }
        else if deck2.count == 0{
            GuerraButton.alpha = 0
            Player2Wins.alpha = 1
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
            score1 = 0
            score2 = 0
            deck1 = []
            deck2 = []
            //randomDeck()
        }

    func randomDeck(){
        var alreadyLeft: [String] = []
        var cardNumber1: Int = 0
        var cardSymbol1: Int = 0
        var cardNumber2: Int = 0
        var cardSymbol2: Int = 0
        var cardName: String = ""
        
        while deck2.count < numberOfCardsPerPlayer{
            repeat {
                cardNumber1 = Int.random(in: 2...14)
                cardSymbol1 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber1)_\(cardSymbol1).png"
            } while alreadyLeft.contains(cardName)
            alreadyLeft.append(cardName)
            deck1.append(cardName)
            
            repeat {
                cardNumber2 = Int.random(in: 2...14)
                cardSymbol2 = Int.random(in: 1...4)
                cardName = "Card_\(cardNumber2)_\(cardSymbol2).png"
            } while alreadyLeft.contains(cardName)
            alreadyLeft.append(cardName)
            deck2.append(cardName)

        }
    }

}
