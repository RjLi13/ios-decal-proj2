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
    var phrase = ""
    var phraseArray: [Character]!
    var stateToImg: [Int:UIImage]!
    var numIncorrectGuesses: Int = 0
    var phraseSetForCorrectness: Set<Character>!
    var canGuess: Bool = true
    var hangmanPhrases: HangmanPhrases!
    var correctGuessesList: Set<Character>!
    var incorrectGuessesList: Set<Character>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        setupViewForHangmanGame(phrase)
    }
    
    func setupViewForHangmanGame(phrase: String){
        incorrectGuessesLabel.text = "Incorrect Guesses: "
        hangmanPhrase.text = ""
        GuessTextField.text = ""
        phraseArray = [Character]()
        stateToImg = [Int:UIImage]()
        numIncorrectGuesses = 0
        phraseSetForCorrectness = Set<Character>()
        print(phrase)
        hangmanPhrase.text = ""
        for character in phrase.characters {
            if character == " " {
                hangmanPhrase.text?.append(" " as Character)
                phraseArray.append(" " as Character)
            } else {
                hangmanPhrase.text?.append("-" as Character)
                phraseArray.append("-" as Character)
                phraseSetForCorrectness.insert(character)
            }
        }
        stateToImg[0] = UIImage(named: "hangman1.gif")
        stateToImg[1] = UIImage(named: "hangman2.gif")
        stateToImg[2] = UIImage(named: "hangman3.gif")
        stateToImg[3] = UIImage(named: "hangman4.gif")
        stateToImg[4] = UIImage(named: "hangman5.gif")
        stateToImg[5] = UIImage(named: "hangman6.gif")
        stateToImg[6] = UIImage(named: "hangman7.gif")
        hangmanImageView.image = stateToImg[0]
        incorrectGuessesList = Set<Character>()
        correctGuessesList = Set<Character>()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userClickedGuess(sender:UIButton) {
        if canGuess {
            if GuessTextField.text?.characters.count > 1 {
                let alertController = UIAlertController(
                    title: "Too many Chars",
                    message: "Your guess contains more than one character",
                    preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                    (action) in
                    print("OK Pressed")
                }
                alertController.addAction(okAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if let guess = GuessTextField.text where !guess.isEmpty {
                let guessChar = guess.uppercaseString.characters.first!
                if !correctGuessesList.contains(guessChar) && !incorrectGuessesList.contains(guessChar) {
                    if phraseSetForCorrectness.contains(guessChar) {
                        correctGuessesList.insert(guessChar)
                        guessCorrect(guessChar)
                    } else {
                        incorrectGuessesList.insert(guessChar)
                        guessIncorrect(guessChar)
                    }
                }
            }
        }
        
        GuessTextField.text = ""
    }
    
    func guessCorrect(guessChar: Character) {
        var phraseAfterGuess = ""
        
        let phraseStartIndex = phrase.startIndex
        var phraseIndex = phrase.startIndex
        for var i = 0; i < phrase.characters.count; i++ {
            phraseIndex = phraseStartIndex.advancedBy(i)
            if phrase[phraseIndex] == guessChar {
                phraseArray[i] = guessChar
            }
        }
        
        for var i = 0; i < phraseArray.count; i++ {
            phraseAfterGuess.append(phraseArray[i])
        }
        
        hangmanPhrase.text = phraseAfterGuess
        phraseSetForCorrectness.remove(guessChar)
        if phraseSetForCorrectness.count == 0 {
            let alertController = UIAlertController(
                title: "Your Winner",
                message: "Great Job! Unfortunately the prize is in another castle. Try again?",
                preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                (action) in
                print("OK Pressed")
            }
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            canGuess = false
        }
    }
    
    func guessIncorrect(guessChar: Character) {
        incorrectGuessesLabel.text?.append(guessChar as Character)
        incorrectGuessesLabel.text?.append(" " as Character)
        numIncorrectGuesses += 1
        hangmanImageView.image = stateToImg[numIncorrectGuesses]
        if numIncorrectGuesses == 6 {
            let alertController = UIAlertController(
                title: "You Lose",
                message: "You Lost. Try again so you can get the prize.",
                preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                (action) in
                print("OK Pressed")
            }
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            canGuess = false
        }
    }
    
    @IBAction func startOver(sender: UIBarButtonItem) {
        canGuess = true
        phrase = hangmanPhrases.getRandomPhrase()
        setupViewForHangmanGame(phrase)
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
