//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var incorrectGuessesLabel: UILabel!
    
    @IBOutlet weak var hangmanPhrase: UILabel!
   
    
    @IBOutlet weak var GuessTextField: UITextField!
    
    @IBOutlet weak var hangmanImageView: UIImageView!
    
    var phraseLengthChange = 0
    
    var phrase_Array = [Character]()
    
    var stateToImg = [Int:UIImage]()
    
    var numIncorrectGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        var phrase = hangmanPhrases.getRandomPhrase()
        print(phrase)
        hangmanPhrase.text = ""
        for character in phrase.characters {
            if character == " " {
                hangmanPhrase.text?.append(" " as Character)
                phrase_Array.append(" ")
            } else {
                phrase_Array.append("-")
                hangmanPhrase.text?.append("-" as Character)
            }
        }
        phraseLengthChange = phrase.characters.count
        stateToImg[0] = UIImage(named: "hangman1.gif")
        stateToImg[1] = UIImage(named: "hangman2.gif")
        stateToImg[2] = UIImage(named: "hangman3.gif")
        stateToImg[3] = UIImage(named: "hangman4.gif")
        stateToImg[4] = UIImage(named: "hangman5.gif")
        stateToImg[5] = UIImage(named: "hangman6.gif")
        stateToImg[6] = UIImage(named: "hangman7.gif")
        
        hangmanImageView.image = stateToImg[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessCorrect(sender: UIButton) {
        var phraseAfterGuess = ""
        phraseLengthChange -= 1
        if phraseLengthChange >= 0 {
            //TODO: FIx this issue with how to change characters
            for var i = 0; i < phraseLengthChange; i++ {
                if phrase_Array[i] == " " {
                    phraseAfterGuess.append(" " as Character)
                } else {
                    phraseAfterGuess.append("-" as Character)
                }
            }
            print(phraseAfterGuess)
            
            hangmanPhrase.text = phraseAfterGuess
        }
    }
    
    @IBAction func guessIncorrect(sender: UIButton) {
        if GuessTextField.text?.characters.count > 1 {
            print("Bad")
        } else if let guess = GuessTextField.text where !guess.isEmpty {
            let guessChar = guess.characters.first
            incorrectGuessesLabel.text?.append(guessChar! as Character)
            incorrectGuessesLabel.text?.append(" " as Character)
            GuessTextField.text = ""
            numIncorrectGuesses += 1
            hangmanImageView.image = stateToImg[numIncorrectGuesses]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
