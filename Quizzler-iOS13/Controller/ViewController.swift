//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progresssBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    
    var quizBrain =  QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        // quizBrain.checkAnswer(userAnswer: userAnswer) -> we replace the external parameter name.
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        /* we could replace all the previous code with
        if quizBrain.checkAnswer(sender.currentTitle!)
        */
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progresssBar.progress = quizBrain.getProgress()
        
        let options = quizBrain.getOptions()
        choice1.setTitle(options[0], for: .normal)
        choice2.setTitle(options[1], for: .normal)
        choice3.setTitle(options[2], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
}

