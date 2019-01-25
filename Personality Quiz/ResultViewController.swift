//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var responses: [Answer]!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultDesciption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateResult()
    }
    
    func calculateResult() {
        
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        resultTitle.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDesciption.text = mostCommonAnswer.definition
    }
    
    
    

}
