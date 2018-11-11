//
//  Story.swift
//  Destini
//
//  Created by Plamen Kostadinov on 11/11/18.
//  Copyright © 2018 Plamenti Com. All rights reserved.
//

import Foundation

class Story {
    let text: String
    let answerA: String?
    let answerB: String?
    
    init(text: String, answerA: String, answerB: String) {
        self.text = text
        self.answerA = answerA
        self.answerB = answerB
    }
}
