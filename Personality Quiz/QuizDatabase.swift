//
//  File.swift
//  Personality Quiz
//
//  Created by soadap on 1/26/19.
//  Copyright © 2019 soadap. All rights reserved.
//

import Foundation

let Quizes = [
    //quiz #1
    Quiz(name: "Which animal are you?",
                 answers: [AnswerChoices(name: "dog", emoji: "🐶", description: "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."),
                           AnswerChoices(name: "cat", emoji: "🐱", description: "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."),
                           AnswerChoices(name: "rabbit", emoji: "🐰", description: "You love everything that's soft. You are healthy and full of energy."),
                           AnswerChoices(name: "turtle", emoji: "🐢", description: "You are wise beyond your years, and you focus on the details. Slow and steady wins the race.")],
                 questions: [
                    Question(text: "Which food do you like the most?", type:.single,
                             answers: [
                                Answer(text: "Steak", type: "dog"),
                                Answer(text: "Fish", type: "cat"),
                                Answer(text: "Carrots", type: "rabbit"),
                                Answer(text: "Corn", type: "turtle")
                        ]),
                    Question(text: "Which activities do you enjoy?",type: .multiple,
                             answers: [
                                Answer(text: "Swimming", type: "turtle"),
                                Answer(text: "Sleeping", type: "cat"),
                                Answer(text: "Cuddling", type: "rabbit"),
                                Answer(text: "Eating", type: "dog")
                        ]),
                    Question(text: "How much do you enjoy car rides?",
                             type: .ranged,
                             answers: [
                                Answer(text: "I dislike them", type: "cat"),
                                Answer(text: "I get a little nervous",type: "rabbit"),
                                Answer(text: "I barely notice them",type: "turtle"),
                                Answer(text: "I love them", type: "dog")
                        ])
    ]),

//quiz #2

Quiz(name: "Test Quiz 1", answers: [
    AnswerChoices(name: "answer1", emoji: "1", description: "Some text about answer 1"),
    AnswerChoices(name: "answer2", emoji: "2", description: "Some text about answer 2"),
    AnswerChoices(name: "answer3", emoji: "3", description: "Some text about answer 3")
    ], questions: [
        Question(text: "Question with single choices #1", type: .single, answers: [
            Answer(text: "answer for 1", type: "answer1"),
            Answer(text: "answer for 2", type: "answer2"),
            Answer(text: "answer for 3", type: "answer3"),
        ]),
        Question(text: "Question with single choices #2", type: .single, answers: [
            Answer(text: "answer for 1", type: "answer1"),
            Answer(text: "answer for 2", type: "answer2"),
            Answer(text: "answer for 3", type: "answer3"),
            Answer(text: "again answer for 2", type: "answer2")
        ]),
        Question(text: "Question with multiple choices #1", type: .multiple, answers: [
            Answer(text: "answer for 1", type: "answer1"),
            Answer(text: "answer for 2", type: "answer2"),
            Answer(text: "answer for 3", type: "answer3"),
            Answer(text: "again answer for 1", type: "answer1")
        ]),
        Question(text: "Question with multiple choices #2", type: .multiple, answers: [
            Answer(text: "answer for 1", type: "answer1"),
            Answer(text: "answer for 2", type: "answer2"),
            Answer(text: "answer for 3", type: "answer3")
        ]),
        Question(text: "Question with range #1", type: .ranged, answers: [
            Answer(text: "answer for 1", type: "answer1"),
            Answer(text: "answer for 2", type: "answer2"),
            Answer(text: "answer for 3", type: "answer3")
        ])
    ]),

//quiz #3
    
    Quiz(name: "Test Quiz 2", answers: [
        AnswerChoices(name: "answer1", emoji: "1", description: "Some text about answer 1"),
        AnswerChoices(name: "answer2", emoji: "2", description: "Some text about answer 2"),
        ], questions: [
            Question(text: "Question with single choices #1", type: .single, answers: [
                Answer(text: "answer for 1", type: "answer1"),
                Answer(text: "answer for 2", type: "answer2"),
                ]),
            Question(text: "Question with single choices #2", type: .single, answers: [
                Answer(text: "answer for 1", type: "answer1"),
                Answer(text: "answer for 2", type: "answer2"),
                Answer(text: "again answer for 2", type: "answer2")
                ]),
            Question(text: "Question with multiple choices #1", type: .multiple, answers: [
                Answer(text: "answer for 1", type: "answer1"),
                Answer(text: "answer for 2", type: "answer2"),
                Answer(text: "again answer for 1", type: "answer1")
                ]),
            Question(text: "Question with multiple choices #2", type: .multiple, answers: [
                Answer(text: "answer for 1", type: "answer1"),
                Answer(text: "answer for 2", type: "answer2"),
                ]),
            Question(text: "Question with range #1", type: .ranged, answers: [
                Answer(text: "answer for 1", type: "answer1"),
                Answer(text: "answer for 2", type: "answer2"),
                ])
        ])
]

