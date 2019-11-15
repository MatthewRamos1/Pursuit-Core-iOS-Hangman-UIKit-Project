//
//  Game.swift
//  Hangman
//
//  Created by Matthew Ramos on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class Game {
    var missCount = 0
    var chosenWord: String = ""
    var hasWord: Bool {
        chosenWord != ""
    }
    var hiddenWordArray: [Character] = []
    var chosenWordArray: [Character] = []

   
    
    func arrayCreation () {
        for letter in chosenWord {
            hiddenWordArray.append("_")
            chosenWordArray.append(letter)
        }
    }
    
    func wordStringCreation() -> String {
        var word = ""
        for letter in hiddenWordArray {
            word.append(letter)
            word.append(" ")
        }
        return word
    }
    
    func letterCheck(_ input: Character) -> InWord {
        var wasInWord: InWord = .incorrect
        for index in 0...(chosenWordArray.count - 1) {
            if input == chosenWordArray[index] {
                hiddenWordArray[index] = input
                wasInWord = .correct
            }
            }
        if wasInWord == .incorrect {
            missCount += 1
        }
        return wasInWord
        }
    
    func gameOver() {
        if missCount == 7 {
            
        }
    }
}
