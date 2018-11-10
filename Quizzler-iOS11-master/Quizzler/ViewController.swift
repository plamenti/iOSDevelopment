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
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Starting point
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from the DataBase
        let firstQuestion = allQuestions.list[questionNumber]
        
        // Send get data to the View
        questionLabel.text = firstQuestion.questinsText
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber == allQuestions.list.count{
            print("End of Quiz")
            questionNumber = 0
        }
        
        questionLabel.text = allQuestions.list[questionNumber].questinsText
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if(correctAnswer == pickedAnswer){
            print("You got it!")
        }
        else{
            print("Wrong!")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
