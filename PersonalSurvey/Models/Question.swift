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

    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Что вы делаете после того как проснулись ",
                responseType: .single,
                answers: [
                    Answer(title: "Беру телефон в руки", animal: .blackHole),
                    Answer(title: "Делаю зарядку", animal: .commonPerson),
                    Answer(title: "Делаю записи в дневник", animal: .deliberate),
                    Answer(title: "Сажусь за учёбу", animal: .reality)
                ]
            ),
            Question(
                title: "Как вы проводите своё свободное время?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Смотрю тик-ток, сижу в соц сетях", animal: .blackHole),
                    Answer(title: "Занимаюсь саморазвитием", animal: .reality),
                    Answer(title: "Занимаюсь спортом", animal: .deliberate),
                    Answer(title: "Гуляю", animal: .commonPerson)
                ]
            ),
            Question(
                title: "Любите ли вы читать книги?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .blackHole),
                    Answer(title: "Нервничаю", animal: .deliberate),
                    Answer(title: "Не замечаю", animal: .commonPerson),
                    Answer(title: "Обожаю", animal: .reality)
                ]
            ),
        ]
    }
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

enum Animal: Character {
    case blackHole = "🧟‍♂️"
    case commonPerson = "🙎"
    case deliberate = "🥷"
    case reality = "🐢"

    var definition: String {
        switch self {
        case .blackHole:
            return "Вы тратите своё время и направляете свои силы не в то русло"
        case .commonPerson:
            return "Вы проживаете свою жизнь как обычный человек"
        case .deliberate:
            return "Вы понимаете что происходит в вашей жизни и управляете свое реальностью"
        case .reality:
            return "Вы сама реальность"
        }
    }
}
