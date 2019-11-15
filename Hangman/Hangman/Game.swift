//
//  Game.swift
//  Hangman
//
//  Created by Matthew Ramos on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum InWord {
    case correct
    case incorrect
}

struct Word {
    var chosenWord: String
    
    func letterCheck (_ input: String) -> InWord {
        if chosenWord.contains(input) {
            return .correct
        } else {
            return .incorrect
            
        }
    }
}
