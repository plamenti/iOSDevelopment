//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    var storiesBank: StoriesBank
    var currentStory: Story
    var currentStoryKey: String

    required init?(coder aDecoder: NSCoder) {
        storiesBank = StoriesBank()
        currentStoryKey = "story1"
        currentStory = storiesBank.stories[currentStoryKey]!
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playGame()
    }

    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Top button is pressed")
            switch currentStoryKey{
                case "story1":
                    currentStoryKey = "story3"
                    playGame()
                case "story2":
                    currentStoryKey = "story3"
                    playGame()
                case "story3":
                    currentStoryKey = "story6"
                    playGame()
                case "story4":
                    currentStoryKey = "story4"
                    playGame()
                    startAgain()
                case "story5":
                    currentStoryKey = "story5"
                    playGame()
                    startAgain()
                case "story6":
                    currentStoryKey = "story6"
                    playGame()
                    startAgain()
            default: print ("no shuch key")
            }
        }
        else if sender.tag == 2 {
            print ("Bottom button is pressed")
            switch currentStoryKey{
                case "story1":
                    currentStoryKey = "story2"
                    playGame()
                case "story2":
                    currentStoryKey = "story4"
                    playGame()
                case "story3":
                    currentStoryKey = "story5"
                    playGame()
                case "story4":
                    currentStoryKey = "story4"
                    playGame()
                    exitGame()
                case "story5":
                    currentStoryKey = "story5"
                    playGame()
                    exitGame()
                case "story6":
                    currentStoryKey = "story6"
                    playGame()
                    exitGame()
                default: print ("no shuch key")
            }
        }
    }
    
    func playGame(){
        print ("Play")
        print ("Current story: \(currentStoryKey)")
        
        currentStory = storiesBank.stories[currentStoryKey]!
        storyTextView.text = currentStory.text
        topButton.setTitle(currentStory.answerA, for: .normal)
        bottomButton.setTitle(currentStory.answerB, for: .normal)
    }
    
    func startAgain(){
        if currentStory.answerA == "Play again?"{
            currentStoryKey = "story1"
            playGame()
        }
    }
    
    func exitGame(){
        print ("Exit game")
        
        if currentStory.answerB == "Exit"{
            // home button pressed programmatically - to thorw app to background
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            // terminaing app in background
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                exit(EXIT_SUCCESS)
            })
        }
        
    }
}

