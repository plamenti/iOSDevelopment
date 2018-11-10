//
//  Question.swift
//  Quizzler
//
//  Created by Plamen Kostadinov on 11/10/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    
    let questinsText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questinsText = text
        answer = correctAnswer
    }
}
