//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Access the DataBase
    let allQuestions = QuestionBank()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Starting point
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from the DataBase
        let firstQuestion = allQuestions.list[0]
        
        // Send get data to the View
        questionLabel.text = firstQuestion.questinsText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        
    }
    
    
    func startOver() {
       
    }
    

    
}
