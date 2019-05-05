//
//  Scrabble.swift
//  Scrabble
//
//  Created by Julio Cesar Aguilar Jimenez on 04/05/2019.
//  Copyright © 2019 Julio C. Aguilar. All rights reserved.
//

import Foundation

class Scrabble {
    private(set) var scoresModel: ScoresModel
    private(set) var score: Int
    private var word: String?
    
    // Initialiser to pass the groupScores and keys in case that they will change
    init(word: String?, groupScores: [Int] = kSCRABBLE_GROUP_SCORES, keys: [[String]] = kSCRABBLE_GROUP_KEYS) {
        self.word = word
        self.score = 0
        self.scoresModel = ScoresModel.init(scoresForGroups: groupScores, keys: keys)
    }
    
    // Initialiser for the normal case (the one suggested by the Unit Tests)
    init(_ word: String?) {
        self.word = word
        self.score = 0
        self.scoresModel = ScoresModel(scoresForGroups: kSCRABBLE_GROUP_SCORES, keys: kSCRABBLE_GROUP_KEYS)
        
        self.score(word: self.word)
    }
    
    
    // Implementation of the score function
    func score(word: String?) {
        // Validation for nil word
        guard let word = word else {
            return
        }
        // Validation for empty string
        guard word != "" else {
            return
        }
        // Remove spaces and uppercase
        let wordToScore = word.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Loop thorugh each character and store the value
        for char in wordToScore {
            self.score += self.scoresModel.scores[String(char)]!
        }
    }
    
    // In case of using the static function, we need to update the score
    func updateScore() {
        self.score(word: self.word)
    }
    
    func updateWord(word: String?) {
        // Reset the score
        self.score = 0
        self.word = word
        self.score(word: self.word)
    }
    
    // Implementation of the score function as static, so it can be called without instantiation
    static func score(_ word: String?) -> Int {
        let scrabbleModel = Scrabble(word: word)
        // Update and return the value
        scrabbleModel.updateScore()
        return scrabbleModel.score
    }
    
}

struct ScoresModel {
    private(set) var scores:Dictionary<String, Int>
    
    init(scoresForGroups:[Int], keys:[[String]]) {
        self.scores = Dictionary()
        // idx keep track of the right score for the group
        var idx = 0
        for group in keys {
            for key in group {
                self.scores[key] = scoresForGroups[idx]
            }
            idx += 1
        }
    }
  
}
