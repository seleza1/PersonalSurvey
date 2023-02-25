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
                    Answer(title: "Делаю зарядку", animal: .cat),
                    Answer(title: "Делаю записи в дневник", animal: .rabbit),
                    Answer(title: "Сажусь за учёбу", animal: .turtle)
                ]
            ),
            Question(
                title: "Как вы проводите своё свободное время?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Смотрю тик-ток, сижу в соц сетях", animal: .blackHole),
                    Answer(title: "Занимаюсь саморазвитием", animal: .cat),
                    Answer(title: "Занимаюсь спортом", animal: .rabbit),
                    Answer(title: "Гуляю", animal: .turtle)
                ]
            ),
            Question(
                title: "Любите ли вы читать книги?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .blackHole),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .cat)
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
    case blackHole = "⬛️"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"

    var definition: String {
        switch self {
        case .blackHole:
            return "Вы проживаете жизнь зря вы - NPC"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}
