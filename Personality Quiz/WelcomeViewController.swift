//
//  ViewController.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: BEGIN_QUIZ_SEGUE, sender: nil)
    }
    
}

