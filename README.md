# Project 2: Hangman App

## Due 
Part 1: Thursday, March 10 at 11:59 PM 


Part 2: Thursday, March 17 at 11:59 PM

## Description 
### Part 1 
We've explored quite a bit of iOS development, and learned how to make simple
apps. Continuing this trend, we are going to make a full-on iOS Hangman game.
This part of the assignment involves dealing with some preliminiaries and
setting up some of the first steps for creating the Hangman game.

### Part 2 
In Part 1, we built the framework for our Hangman game, but not the logic. In
Part 2, you'll be putting everything together into a well-designed and
fully-functional application.  Note that while many of the required features for
Part 2 have already been implemented in Part 1, some requirements have changed
or been refined. These are all noted in the corresponding Instructions section
below.

## Instructions 
**Create a Hangman App (Part 1)**
* Required
  * Start Screen View
    * A UILabel with the name of the game
    * A "New Game" Button (takes you to Game View)
  * Game View
    * A TextField (where the user enters a letter as a guess)
      * Optional: A smart way for the user to guess letters (since a TextField
              for letter entry is bad UX)
    * A UILabel that displays the "-"s corresponding to each word in the
    provided puzzle string
    * A "Correct" Button (for when the user submits a Correct guess)
      * Each tap of this button will remove an "-" from the puzzle label
    * An "Incorrect" Button (for when the user submits an Incorrect guess)
      * Each tap of this button will display the letter in the TextField as an
      Incorrect Guess on the same screen
      * Example: A UILabel that shows "Incorrect Guesses: A B", and then when C
      is guessed, "Incorrect Guesses: A B C"
    * A square-dimensioned UIImageView that represents the "state" of the
    Hangman
      * Appropriate images for each "state" of the Hangman (we provide basic
              ones in /basic-hangman-img)
* Optional
  * Start Screen View
    * Be creative about the design of the background, the title label, the
    buttons, etc.
  * Game View
    * Provide your own customized images for each "state" of the Hangman

**Create a Hangman App (Part 2)**
* Required
  * General
    * All of the features in Part 1, except:
      * Replace the "Correct" and "Incorrect" buttons with "Guess"
      * The "Guess" button should be smart enough to know whether the letter
      entered in the text field is Correct or not, and function appropriately
    * Create a working Hangman game with:
      * The ability to guess a letter (and *only* a letter)
        * If that letter appears in the puzzle string, the corresponding "_"
        should be replaced by the correctly guessed letter
        * If that letter does not appear in the puzzle string, that letter
    should be added to a UILabel keeping track of "Incorrect Guesses: ", and the
    Hangman image should update to represent the number of incorrect guesses
      * A win state, indicated by an Alert (Pop up box)
        * Should prevent additional guesses
      * A fail state, indicated by an Alert (Pop up box)
        * Should prevent additional guesses
      * A "Start Over" button
