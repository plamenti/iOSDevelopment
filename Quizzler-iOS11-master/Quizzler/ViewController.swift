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
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Starting point
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from the DataBase
        // let firstQuestion = allQuestions.list[questionNumber]
        
        // Send get data to the View
        // questionLabel.text = firstQuestion.questinsText
        
        nextQuestion()
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
        scoreLabel.text = "Score: \(score)"
        let allQuestionsCount = allQuestions.list.count
        progressLabel.text = "\(questionNumber + 1)/\(allQuestionsCount)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        if questionNumber == allQuestions.list.count{
            print("End of Quiz")
            scoreLabel.text = "Score: \(score)"
            
            // Create alert controller
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            // Create alert action
            // If 'in' is used the following method should be either closure ( anonymous function) or method from the class
            // If it's method from the class 'slef' should be used
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            // Exit an iOS app without it looking like a crash
            let resetApp = UIAlertAction(title: "Close Now", style: .destructive) {
                (alert) -> Void in
                // home button pressed programmatically - to thorw app to background
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                // terminaing app in background
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    exit(EXIT_SUCCESS)
                })
            }
            
            // Add created action to alert controler
            alert.addAction(restartAction)
            alert.addAction(resetApp)
            
            // Presents alert controller modally
            present(alert, animated: true, completion: nil)
        }
        else{
            questionLabel.text = allQuestions.list[questionNumber].questinsText
            
            updateUI()
        }
        
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if(correctAnswer == pickedAnswer){
            print("You got it!")
            score += 1
        }
        else{
            print("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
}
