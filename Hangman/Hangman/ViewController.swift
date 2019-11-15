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
    var game = Game()
   
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    
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
        }
        return true
    }
}


