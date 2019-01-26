//
//  ViewController.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var buttonsArray : [UIButton] = []
    var currentChoice = 0
    @IBOutlet weak var stackButtons: UIStackView!
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func quizChoosed(sender: UIButton) {
        for btn in buttonsArray {
            btn.setTitleColor(UIColor.gray, for: .normal)
        }
        buttonsArray[sender.tag].setTitleColor(UIColor.blue, for: .normal)
        currentChoice = sender.tag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        for i in 0..<Quizes.count {
            let button = UIButton()
            button.backgroundColor = self.view.backgroundColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.setTitle(Quizes[i].name, for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(quizChoosed), for: .touchUpInside)
            buttonsArray.append(button)
            stackButtons.addArrangedSubview(button)
        }
        
        buttonsArray[0].sendActions(for: .touchUpInside)
    }

    @IBAction func startButton(_ sender: Any) {
        currentQuiz = Quizes[currentChoice]
        performSegue(withIdentifier: BEGIN_QUIZ_SEGUE, sender: nil)
    }
    
}

