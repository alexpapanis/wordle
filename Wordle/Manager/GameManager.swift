//
//  Configuration.swift
//  Wordle
//
//  Created by Alexandre Papanis on 29/12/22.
//

import Foundation

private let data = GameManager()

class GameManager {
    
    class var shared: GameManager {
        return data
    }
    
    let keyboard1 = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    let keyboard2 = ["A", "S", "D", "F", "G", "H", "J", "K", "L", "Ç"]
    let keyboard3 = ["<=", "Z", "X", "C", "V", "B", "N", "M", "OK"]
    
    var wordLength = 5
    var tries = 6
    var currentTry = 0
    
    var word = "SORTE"
}
