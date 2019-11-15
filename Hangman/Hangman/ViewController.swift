//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hangmanView: UIImageView!
    @IBOutlet weak var hangmanLettersLabel: UILabel!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    var game = Game()
    var gameStatusValue: GameValue = .ongoing{
        didSet {
            if gameStatusValue == .ongoing {
                newGameButton.isHidden = true
            } else {
                newGameButton.isHidden = false
            }
        }
    }
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
        newGameButton.isHidden = true
    
  }

    @IBAction func newGamePressed(_ sender: UIButton) {
        game.newGame()
        hangmanView.image = nil
        promptLabel.text = "Input word to be guessed:"
        gameStatusValue = .ongoing
    }
    
}

extension ViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if promptLabel.text == "Input word to be guessed:" {
            game.chosenWord = textField.text ?? "Error"
            game.arrayCreation()
            hangmanLettersLabel.text = game.wordStringCreation()
            textField.text = nil
            promptLabel.text = "Guess a letter:"
            textField.resignFirstResponder()
        }
        return true
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if game.hasWord {
            if game.letterCheck(Character(string)) == .correct {
                hangmanLettersLabel.text = game.wordStringCreation()
            } else {
                switch game.missCount {
                case 1:
                hangmanView.image = #imageLiteral(resourceName: "hangman-7")
                case 2:
                hangmanView.image = #imageLiteral(resourceName: "hangman-6")
                case 3:
                hangmanView.image = #imageLiteral(resourceName: "hangman-5")
                case 4:
                hangmanView.image = #imageLiteral(resourceName: "hangman-4")
                case 5:
                hangmanView.image = #imageLiteral(resourceName: "hangman-3")
                case 6:
                hangmanView.image = #imageLiteral(resourceName: "hangman-2")
                case 7:
                hangmanView.image = #imageLiteral(resourceName: "hangman")
                default:
                    return true
                }
            }
            textField.text = nil
            gameStatusValue = game.gameStatus()
            if gameStatusValue == .win {
                gameResultLabel.text = "You win!"
            } else if gameStatusValue == .loss {
                gameResultLabel.text = "You lose!"
            }
        }
        return true
    }
}


