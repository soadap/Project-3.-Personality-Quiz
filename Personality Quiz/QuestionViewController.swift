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
    @IBOutlet var stackRangeLabel: [UILabel] = []
    @IBOutlet weak var stackRangeSlider: UISlider!
    @IBOutlet weak var stackMultipleLabelsStacksView: UIStackView!
    
    @IBOutlet var stackMultipleLabelStacks : [UIStackView] = []
    @IBOutlet var stackMultipleLabelStacksSwitches : [UISwitch] = []
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var stackMultipleSwitch: [UISwitch]!
    
    var currentAnswers : [Answer]!
    
    var answersChosen: [String] = []
    var questions: [Question] = []
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = currentQuiz.questions.shuffled()
        updateUI()
    }
    
   // functions after answer was choosen
    
    @IBAction func stackSingleButtonClicked(_ sender: UIButton) {
        answersChosen.append(currentAnswers[sender.tag].type)
        
        nextQuestion()
    }
    
    @IBAction func stackRangeButtonClicked(_ sender: Any) {
        let index = Int(round(stackRangeSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index].type)

        nextQuestion()
   }
    
    @IBAction func stackMultipleButtonClicked(_ sender: Any) {
        for sw in stackMultipleLabelStacksSwitches {
            if sw.isOn {
                answersChosen.append(currentAnswers[sw.tag].type)
            }
        }
        nextQuestion()
    }
    
    //func to show appropriate stackview for question
    
    func updateUI() {
        stackSingleQuestionView.isHidden = true
        stackMultipleQuestionView.isHidden = true
        stackRangeQuestionView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        currentAnswers = currentQuestion.answers
        progressView.setProgress((Float(questionIndex)/Float(questions.count)), animated: true)
        
        questionLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            currentAnswers.shuffle()
            updateSingleStack(using: currentAnswers)
        case .multiple:
            currentAnswers.shuffle()
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    //functions to update stackview with answers
    
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
        if !stackMultipleLabelStacks.isEmpty {
            for stck in stackMultipleLabelStacks {
                stck.removeFromSuperview()
            }
            stackMultipleLabelStacks.removeAll()
            stackMultipleLabelStacksSwitches.removeAll()
        }
        
        for i in 0..<answers.count {
            let stack = UIStackView()
            stack.alignment = .center
            stack.distribution = .fill
            stack.axis = .horizontal
            
            let label = UILabel()
            label.text = answers[i].text
            label.textColor = UIColor.black
            
            stack.addArrangedSubview(label)
            
            let sw = UISwitch()
            sw.isOn = false
            sw.tag = i
            
            stack.addArrangedSubview(sw)
            
            stackMultipleLabelStacks.append(stack)
            stackMultipleLabelStacksSwitches.append(sw)
            
            stackMultipleLabelsStacksView.addArrangedSubview(stack)
        }
        stackMultipleQuestionView.isHidden = false
    }
    
    func updateRangedStack(using answers: [Answer]) {
        stackRangeQuestionView.isHidden = false
        stackRangeSlider.setValue(0.5, animated: false)
        stackRangeLabel[0].text = answers.first?.text
        stackRangeLabel[1].text = answers.last?.text
    }
    
    //next question
    
    func nextQuestion() {
        questionIndex += 1
               
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: SHOW_RESULT_SEGUE, sender: nil)
        }
    }
    
    //segue for view with results
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOW_RESULT_SEGUE {
            if let resultViewController = segue.destination as? ResultViewController {
                resultViewController.responses = answersChosen
            }
            
        }
    }
}


