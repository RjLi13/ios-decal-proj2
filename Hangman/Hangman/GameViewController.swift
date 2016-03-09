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
    
    var phraseLengthChange = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        var phrase = hangmanPhrases.getRandomPhrase()
        print(phrase)
        for character in phrase.characters {
            if character == " " {
                hangmanPhrase.text?.append(" " as Character)
            } else {
                hangmanPhrase.text?.append("-" as Character)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessCorrect(sender: UIButton) {
        let phraseLengthChange = (hangmanPhrase.text?.characters.count)! - 1
        if phraseLengthChange >= 0 {
            //TODO: FIx this issue with how to change characters
//            Array(arrayLiteral: hangmanPhrase.text)[phraseLengthChange] = ""
        }
    }
    
    @IBAction func guessIncorrect(sender: UIButton) {
        print("Hi")
        if GuessTextField.text?.characters.count > 1 {
            print("Bad")
        } else if let guess = GuessTextField.text where !guess.isEmpty {
            let guessChar = guess.characters.first
            incorrectGuessesLabel.text?.append(guessChar! as Character)
            incorrectGuessesLabel.text?.append(" " as Character)
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
