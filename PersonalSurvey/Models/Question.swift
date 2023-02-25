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
                title: "Как вы проводите своё свободное время?",
                responseType: .single,
                answers: [
                    Answer(title: "Смотрю тик-ток, сижу в соц сетях", animal: .blackHole),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle)
                ]
            ),
            Question(
                title: "Что вам нравится больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Сидеть дома", animal: .blackHole),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обнматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .blackHole)
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
