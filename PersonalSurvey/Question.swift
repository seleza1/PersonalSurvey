//
//  Question.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal {
    case dog
    case cat
    case rabbit
    case turtle
}


