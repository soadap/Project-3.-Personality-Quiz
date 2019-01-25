//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var stackSingleQuestionView: UIStackView!
    @IBOutlet weak var stackMultipleQuestionView: UIStackView!
    @IBOutlet weak var stackRangeQuestionView: UIStackView!
    
    @IBOutlet var stackSingleButtons: [UIButton] = []
    @IBOutlet var stackMultipleLabel: [UILabel] = []
    @IBOutlet var stackRangeLabel: [UILabel] = []
    @IBOutlet weak var stackRangeSlider: UISlider!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var stackMultipleSwitch: [UISwitch]!
    
    var answersChosen: [Answer] = []
    var questions: [Question] = []
    
    @IBAction func stackSingleButtonClicked(_ sender: UIButton) {
        answersChosen.append(questions[questionIndex].answers[sender.tag])
        nextQuestion()
    }
    
    @IBAction func stackRangeButtonClicked(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(stackRangeSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
   }
    
    @IBAction func stackMultipleButtonClicked(_ sender: Any) {
        for sw in stackMultipleSwitch {
            if sw.isOn {
                answersChosen.append(questions[questionIndex].answers[sw.tag])
            }
        }
        nextQuestion()
    }
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = questArray.shuffled()
        updateUI()
    }
    
    func updateUI() {
        stackSingleQuestionView.isHidden = true
        stackMultipleQuestionView.isHidden = true
        stackRangeQuestionView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers.shuffled()
        progressView.setProgress((Float(questionIndex)/Float(questions.count)), animated: true)
        
        questionLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        if !stackSingleButtons.isEmpty {
            for btn in stackSingleButtons {
                btn.removeFromSuperview()
            }
            stackSingleButtons.removeAll()
        }
        
        for i in 0..<answers.count {
            let button = UIButton()
            button.backgroundColor = self.view.backgroundColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.setTitle(answers[i].text, for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(stackSingleButtonClicked), for: .touchUpInside)
            stackSingleButtons.append(button)
            stackSingleQuestionView.addArrangedSubview(button)
        }
        stackSingleQuestionView.isHidden = false
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        stackMultipleQuestionView.isHidden = false
        for i in 0..<stackMultipleLabel.count {
            stackMultipleLabel[i].text = answers[i].text
            stackMultipleSwitch[i].isOn = false
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        stackRangeQuestionView.isHidden = false
        stackRangeSlider.setValue(0.5, animated: false)
        stackRangeLabel[0].text = answers.first?.text
        stackRangeLabel[1].text = answers.last?.text
    }
    
    func nextQuestion() {
        questionIndex += 1
               
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: SHOW_RESULT_SEGUE, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOW_RESULT_SEGUE {
            if let resultViewController = segue.destination as? ResultViewController {
                resultViewController.responses = answersChosen
            }
            
        }
    }
}


