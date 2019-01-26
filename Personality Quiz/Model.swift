//
//  Model.swift
//  Personality Quiz
//
//  Created by soadap on 1/22/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import Foundation

var currentQuiz : Quiz!

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: String
}

struct AnswerChoices {
    var name: String
    var emoji: String
    var description: String
}


struct Quiz {
    var name : String
    var answers : [AnswerChoices]
    var questions : [Question]
}

