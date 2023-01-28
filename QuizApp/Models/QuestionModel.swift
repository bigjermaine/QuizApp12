//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Apple on 28/01/2023.
//

import Foundation




struct Question {
    let text:String
    let answers: [Answer]
    
}
struct Answer {
    let text:String
    let correct:Bool
}
