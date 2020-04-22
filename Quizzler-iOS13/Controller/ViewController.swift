//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var qb = QuizBrain()

    @IBAction func answerKey(_ sender: UIButton) {
       
        let answer = sender.currentTitle!
        let userGotItRight = qb.checkAnswer(answer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green

        } else {
            sender.backgroundColor = UIColor.red
        }
        qb.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
   @objc func updateUi() {
        questionLabel.text = qb.getQuestionText()
        progressBar.progress = qb.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

