//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var responses: [String]!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultDesciption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    func calculateResult() {
        var finalAnswer : AnswerChoices!
        var frequencyOfAnswers: [String: Int] = [:]
        
        for response in responses {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        for final in currentQuiz.answers {
            if mostCommonAnswer == final.name {
                finalAnswer = final
            }
        }
        
        resultTitle.text = "You are a \(finalAnswer.emoji)"
        resultDesciption.text = finalAnswer.description
    }
    
    
    

}
